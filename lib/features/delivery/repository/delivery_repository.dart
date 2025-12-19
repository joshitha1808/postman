import 'package:fpdart/fpdart.dart';
import 'package:postman/core/error/failure.dart';
import 'package:postman/features/delivery/model/delivery_list.dart';
import 'package:postman/features/delivery/model/parcel.dart';
import 'package:postman/features/delivery/model/status_update.dart';

/// Abstract repository interface for delivery operations
abstract class DeliveryRepository {
  /// Get daily delivery list for a postman
  Future<Either<Failure, DeliveryList>> getDeliveries({
    required String postmanId,
    DateTime? deliveryDate,
  });

  /// Update the status of a parcel
  Future<Either<Failure, StatusUpdateResponse>> updateParcelStatus({
    required String parcelId,
    required StatusUpdateRequest request,
  });

  /// Get a single parcel by ID (from local cache or remote)
  Future<Either<Failure, Parcel>> getParcel(String parcelId);

  /// Start delivery route - marks all pending parcels as OUT_FOR_DELIVERY
  Future<Either<Failure, int>> startDeliveryRoute({
    required String postmanId,
    required List<String> parcelIds,
    double? lat,
    double? lng,
  });
}
