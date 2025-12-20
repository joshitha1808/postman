import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/location_models.dart';

/// Service for managing WebSocket connection for location streaming
class LocationWebSocketService {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _pingTimer;
  Timer? _reconnectTimer;

  final _connectionController = StreamController<bool>.broadcast();
  final _messageController = StreamController<LocationMessage>.broadcast();

  String? _wsUrl;
  bool _shouldReconnect = false;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _reconnectDelay = Duration(seconds: 5);
  static const Duration _pingInterval = Duration(seconds: 30);

  /// Stream of connection status changes
  Stream<bool> get connectionStream => _connectionController.stream;

  /// Stream of incoming messages
  Stream<LocationMessage> get messageStream => _messageController.stream;

  /// Whether currently connected
  bool get isConnected => _channel != null;

  /// Connect to WebSocket server
  Future<bool> connect(String wsUrl) async {
    _wsUrl = wsUrl;
    _shouldReconnect = true;
    _reconnectAttempts = 0;

    return _doConnect();
  }

  Future<bool> _doConnect() async {
    if (_wsUrl == null) return false;

    try {
      log('Connecting to WebSocket: $_wsUrl');

      _channel = WebSocketChannel.connect(Uri.parse(_wsUrl!));

      // Wait for connection
      await _channel!.ready;

      log('WebSocket connected');
      _connectionController.add(true);
      _reconnectAttempts = 0;

      // Listen for messages
      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
      );

      // Start ping timer to keep connection alive
      _startPingTimer();

      return true;
    } catch (e) {
      log('WebSocket connection error: $e');
      _connectionController.add(false);
      _scheduleReconnect();
      return false;
    }
  }

  void _onMessage(dynamic data) {
    try {
      final json = jsonDecode(data as String) as Map<String, dynamic>;
      final message = LocationMessage.fromJson(json);

      log('WebSocket message received: ${message.type}');

      // Handle pong (response to our ping)
      if (message.type == LocationMessageType.pong) {
        log('Received pong');
        return;
      }

      _messageController.add(message);
    } catch (e) {
      log('Error parsing WebSocket message: $e');
    }
  }

  void _onError(dynamic error) {
    log('WebSocket error: $error');
    _connectionController.add(false);
    _cleanup();
    _scheduleReconnect();
  }

  void _onDone() {
    log('WebSocket connection closed');
    _connectionController.add(false);
    _cleanup();
    _scheduleReconnect();
  }

  void _startPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(_pingInterval, (_) {
      sendPing();
    });
  }

  void _scheduleReconnect() {
    if (!_shouldReconnect) return;
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      log('Max reconnect attempts reached');
      return;
    }

    _reconnectTimer?.cancel();
    _reconnectAttempts++;

    final delay = _reconnectDelay * _reconnectAttempts;
    log(
      'Scheduling reconnect attempt $_reconnectAttempts in ${delay.inSeconds}s',
    );

    _reconnectTimer = Timer(delay, () {
      if (_shouldReconnect) {
        _doConnect();
      }
    });
  }

  /// Send location update
  void sendLocationUpdate(LocationUpdate update) {
    if (_channel == null) {
      log('Cannot send: WebSocket not connected');
      return;
    }

    try {
      final message = LocationMessage(
        type: LocationMessageType.locationUpdate,
        data: update,
      );

      _channel!.sink.add(jsonEncode(message.toJson()));
      log('Location sent: ${update.latitude}, ${update.longitude}');
    } catch (e) {
      log('Error sending location update: $e');
    }
  }

  /// Send ping to keep connection alive
  void sendPing() {
    if (_channel == null) return;

    try {
      final message = LocationMessage(type: LocationMessageType.ping);
      _channel!.sink.add(jsonEncode(message.toJson()));
      log('Ping sent');
    } catch (e) {
      log('Error sending ping: $e');
    }
  }

  void _cleanup() {
    _pingTimer?.cancel();
    _pingTimer = null;
    _subscription?.cancel();
    _subscription = null;
    _channel = null;
  }

  /// Disconnect from WebSocket
  Future<void> disconnect() async {
    log('Disconnecting WebSocket');
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;

    _cleanup();

    try {
      await _channel?.sink.close();
    } catch (e) {
      log('Error closing WebSocket: $e');
    }

    _connectionController.add(false);
  }

  /// Dispose resources
  void dispose() {
    disconnect();
    _connectionController.close();
    _messageController.close();
  }
}
