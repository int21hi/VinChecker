// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VinModelImpl _$$VinModelImplFromJson(Map<String, dynamic> json) =>
    _$VinModelImpl(
      vin: json['vin'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      modelYear: json['model_year'] as String,
      family: json['family'] as String,
      bodyClass: json['body_class'] as String,
      vehicleType: json['vehicle_type'] as String,
      plantCountry: json['plant_country'] as String,
      rawResults: json['raw_results'] == null
          ? <String, dynamic>{}
          : Map<String, dynamic>.from(json['raw_results'] as Map),
      scannedAt: DateTime.parse(json['scanned_at'] as String),
    );

Map<String, dynamic> _$$VinModelImplToJson(_$VinModelImpl instance) =>
    <String, dynamic>{
      'vin': instance.vin,
      'make': instance.make,
      'model': instance.model,
      'model_year': instance.modelYear,
      'family': instance.family,
      'body_class': instance.bodyClass,
      'vehicle_type': instance.vehicleType,
      'plant_country': instance.plantCountry,
      'raw_results': instance.rawResults,
      'scanned_at': instance.scannedAt.toIso8601String(),
    };
