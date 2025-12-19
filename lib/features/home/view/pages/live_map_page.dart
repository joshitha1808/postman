import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postman/features/home/providers/live_location_provider.dart';

class LiveMapPage extends ConsumerStatefulWidget {
  const LiveMapPage({super.key});

  @override
  ConsumerState<LiveMapPage> createState() => _LiveMapPageState();
}

class _LiveMapPageState extends ConsumerState<LiveMapPage> {
  GoogleMapController? _mapController;
  Position? _lastPosition;
  ProviderSubscription<AsyncValue<Position>>? _positionSub;

  @override
  void initState() {
    super.initState();

    _positionSub = ref.listenManual<AsyncValue<Position>>(
      livePositionStreamProvider,
      (_, next) {
        next.whenData(_handleNewPosition);
      },
    );
  }

  @override
  void dispose() {
    _positionSub?.close();
    _mapController?.dispose();
    super.dispose();
  }

  void _handleNewPosition(Position position) {
    _lastPosition = position;

    final controller = _mapController;
    if (controller == null) return;

    controller.animateCamera(
      CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final positionAsync = ref.watch(livePositionStreamProvider);

    final initialTarget = _lastPosition != null
        ? LatLng(_lastPosition!.latitude, _lastPosition!.longitude)
        : const LatLng(20.5937, 78.9629);

    final marker = _lastPosition == null
        ? const <Marker>{}
        : {
            Marker(
              markerId: const MarkerId('me'),
              position: LatLng(
                _lastPosition!.latitude,
                _lastPosition!.longitude,
              ),
              infoWindow: const InfoWindow(title: 'You'),
            ),
          };

    return Scaffold(
      appBar: AppBar(title: const Text('Live Location')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialTarget,
              zoom: _lastPosition == null ? 4 : 16,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            markers: marker,
            onMapCreated: (controller) {
              _mapController = controller;
              final last = _lastPosition;
              if (last != null) {
                controller.moveCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(last.latitude, last.longitude),
                    16,
                  ),
                );
              }
            },
          ),
          positionAsync.when(
            data: (_) => const SizedBox.shrink(),
            loading: () => Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Material(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Getting live location…',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            error: (err, _) => Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Material(
                  color: theme.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_off,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            err.toString(),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () async {
                            await Geolocator.openAppSettings();
                          },
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
