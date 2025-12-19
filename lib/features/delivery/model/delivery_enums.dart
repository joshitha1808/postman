/// Delivery status enum matching backend API
enum DeliveryStatus {
  pending('PENDING'),
  outForDelivery('OUT_FOR_DELIVERY'),
  delivered('DELIVERED'),
  failed('FAILED'),
  rescheduled('RESCHEDULED');

  final String value;
  const DeliveryStatus(this.value);

  /// Parse from API string value
  static DeliveryStatus fromString(String value) {
    return DeliveryStatus.values.firstWhere(
      (e) => e.value == value.toUpperCase(),
      orElse: () => DeliveryStatus.pending,
    );
  }

  /// Get display label for UI
  String get displayLabel {
    switch (this) {
      case DeliveryStatus.pending:
        return 'Pending';
      case DeliveryStatus.outForDelivery:
        return 'Out for Delivery';
      case DeliveryStatus.delivered:
        return 'Delivered';
      case DeliveryStatus.failed:
        return 'Failed';
      case DeliveryStatus.rescheduled:
        return 'Rescheduled';
    }
  }

  /// Check if status allows transition to another status
  bool canTransitionTo(DeliveryStatus newStatus) {
    switch (this) {
      case DeliveryStatus.pending:
        return newStatus == DeliveryStatus.outForDelivery;
      case DeliveryStatus.outForDelivery:
        return [
          DeliveryStatus.delivered,
          DeliveryStatus.failed,
          DeliveryStatus.rescheduled,
        ].contains(newStatus);
      case DeliveryStatus.failed:
        return [
          DeliveryStatus.outForDelivery,
          DeliveryStatus.rescheduled,
        ].contains(newStatus);
      case DeliveryStatus.rescheduled:
        return newStatus == DeliveryStatus.outForDelivery;
      case DeliveryStatus.delivered:
        return false; // Final state
    }
  }
}

/// Delivery priority enum matching backend API
enum DeliveryPriority {
  urgent('URGENT'),
  normal('NORMAL'),
  low('LOW');

  final String value;
  const DeliveryPriority(this.value);

  static DeliveryPriority fromString(String value) {
    return DeliveryPriority.values.firstWhere(
      (e) => e.value == value.toUpperCase(),
      orElse: () => DeliveryPriority.normal,
    );
  }

  String get displayLabel {
    switch (this) {
      case DeliveryPriority.urgent:
        return 'Urgent';
      case DeliveryPriority.normal:
        return 'Normal';
      case DeliveryPriority.low:
        return 'Low';
    }
  }
}

/// Failure reason enum for failed deliveries
enum FailureReason {
  customerNotAvailable('CUSTOMER_NOT_AVAILABLE'),
  wrongAddress('WRONG_ADDRESS'),
  addressNotFound('ADDRESS_NOT_FOUND'),
  customerRefused('CUSTOMER_REFUSED'),
  codNotReady('COD_NOT_READY'),
  accessRestricted('ACCESS_RESTRICTED'),
  weatherIssue('WEATHER_ISSUE'),
  other('OTHER');

  final String value;
  const FailureReason(this.value);

  static FailureReason fromString(String value) {
    return FailureReason.values.firstWhere(
      (e) => e.value == value.toUpperCase(),
      orElse: () => FailureReason.other,
    );
  }

  String get displayLabel {
    switch (this) {
      case FailureReason.customerNotAvailable:
        return 'Customer Not Available';
      case FailureReason.wrongAddress:
        return 'Wrong Address';
      case FailureReason.addressNotFound:
        return 'Address Not Found';
      case FailureReason.customerRefused:
        return 'Customer Refused';
      case FailureReason.codNotReady:
        return 'COD Payment Not Ready';
      case FailureReason.accessRestricted:
        return 'Access Restricted';
      case FailureReason.weatherIssue:
        return 'Weather Issue';
      case FailureReason.other:
        return 'Other';
    }
  }
}
