class VinEntity {
  final String vin;
  final String make;
  final String model;
  final String modelYear;
  final String family;
  final String bodyClass;
  final String vehicleType;
  final String plantCountry;
  final Map<String, dynamic> rawResults;
  final DateTime scannedAt;

  const VinEntity({
    required this.vin,
    required this.make,
    required this.model,
    required this.modelYear,
    required this.family,
    required this.bodyClass,
    required this.vehicleType,
    required this.plantCountry,
    required this.rawResults,
    required this.scannedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VinEntity &&
          runtimeType == other.runtimeType &&
          vin == other.vin &&
          make == other.make &&
          model == other.model &&
          modelYear == other.modelYear &&
          family == other.family &&
          bodyClass == other.bodyClass &&
          vehicleType == other.vehicleType &&
          plantCountry == other.plantCountry &&
          rawResults == other.rawResults &&
          scannedAt == other.scannedAt;

  @override
  int get hashCode =>
      vin.hashCode ^
      make.hashCode ^
      model.hashCode ^
      modelYear.hashCode ^
      family.hashCode ^
      bodyClass.hashCode ^
      vehicleType.hashCode ^
      plantCountry.hashCode ^
      rawResults.hashCode ^
      scannedAt.hashCode;
}
