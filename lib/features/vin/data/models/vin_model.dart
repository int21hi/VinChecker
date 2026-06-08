import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vin_entity.dart';

part 'vin_model.freezed.dart';
part 'vin_model.g.dart';

@freezed
class VinModel with _$VinModel implements VinEntity {
  const factory VinModel({
    required String vin,
    required String make,
    required String model,
    required String modelYear,
    required String family,
    required String bodyClass,
    required String vehicleType,
    required String plantCountry,
    required Map<String, dynamic> rawResults,
    required DateTime scannedAt,
  }) = _VinModel;

  const VinModel._();

  factory VinModel.fromJson(Map<String, dynamic> json) =>
      _$VinModelFromJson(json);

  factory VinModel.fromEntity(VinEntity entity) {
    return VinModel(
      vin: entity.vin,
      make: entity.make,
      model: entity.model,
      modelYear: entity.modelYear,
      family: entity.family,
      bodyClass: entity.bodyClass,
      vehicleType: entity.vehicleType,
      plantCountry: entity.plantCountry,
      rawResults: entity.rawResults,
      scannedAt: entity.scannedAt,
    );
  }
}
