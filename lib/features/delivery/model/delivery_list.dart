import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postman/features/delivery/model/delivery_enums.dart';
import 'package:postman/features/delivery/model/parcel.dart';

part 'delivery_list.freezed.dart';
part 'delivery_list.g.dart';

/// Response model for daily delivery list
@freezed
abstract class DeliveryList with _$DeliveryList {
  const DeliveryList._();

  const factory DeliveryList({
    required DateTime date,
    @JsonKey(name: 'postman_id') required String postmanId,
    @JsonKey(name: 'total_parcels') required int totalParcels,
    @JsonKey(name: 'pending_count') required int pendingCount,
    @JsonKey(name: 'delivered_count') required int deliveredCount,
    @JsonKey(name: 'failed_count') required int failedCount,
    required List<Parcel> parcels,
  }) = _DeliveryList;

  factory DeliveryList.fromJson(Map<String, dynamic> json) =>
      _$DeliveryListFromJson(json);

  /// Get parcels filtered by status
  List<Parcel> parcelsByStatus(DeliveryStatus status) =>
      parcels.where((p) => p.status == status).toList();

  /// Get progress percentage (delivered / total)
  double get progressPercentage {
    if (totalParcels == 0) return 0.0;
    return deliveredCount / totalParcels;
  }

  /// Count of parcels that are out for delivery
  int get outForDeliveryCount =>
      parcels.where((p) => p.status == DeliveryStatus.outForDelivery).length;
}
