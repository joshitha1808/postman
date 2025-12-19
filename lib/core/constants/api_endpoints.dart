/// API endpoints and constants for the Postman Companion app
class ApiEndpoints {
  ApiEndpoints._();

  // Base configuration - update these for production
  static const String baseUrl = 'http://localhost:8000';
  static const String apiPrefix = '/api/v1';
  static const String apiUrl = '$baseUrl$apiPrefix';

  // Authentication
  static const String login = '$apiUrl/auth/login';
  static const String loginJson = '$apiUrl/auth/login/json';
  static const String me = '$apiUrl/auth/me';

  // Postman Management
  static const String dutyStatus = '$apiUrl/postman/duty-status';
  static String postmanStats(String postmanId) =>
      '$apiUrl/postman/$postmanId/stats';

  // Deliveries
  static String deliveries(String postmanId) =>
      '$apiUrl/postman/$postmanId/deliveries';
  static String parcelStatus(String parcelId) =>
      '$apiUrl/parcel/$parcelId/status';
  static String locationPin(String parcelId) =>
      '$apiUrl/parcel/$parcelId/location-pin';

  // Location Tracking
  static const String locationUpdate = '$apiUrl/location/update';
  static const String locationCurrent = '$apiUrl/location/current';
  static String locationWebSocket(String postmanId, String token) =>
      'ws://${baseUrl.replaceFirst('http://', '')}/ws/location/$postmanId?token=$token';

  // Route Optimization
  static String routeOptimize(String postmanId) =>
      '$apiUrl/route/optimize/$postmanId';

  // Proof of Delivery
  static String generateOtp(String parcelId) =>
      '$apiUrl/parcel/$parcelId/generate-otp';
  static String verifyOtp(String parcelId) =>
      '$apiUrl/parcel/$parcelId/verify-otp';
  static String submitProof(String parcelId) =>
      '$apiUrl/parcel/$parcelId/proof';

  // File Uploads
  static const String uploadPodPhoto = '$apiUrl/upload/pod-photo';
  static const String uploadSignature = '$apiUrl/upload/signature';

  // Health Check
  static const String health = '$baseUrl/health';
}
