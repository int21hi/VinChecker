import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../models/vin_model.dart';

abstract class VinRemoteDataSource {
  Future<VinModel> decodeVin(String vin);
}

class VinRemoteDataSourceImpl implements VinRemoteDataSource {
  final Dio dio;

  VinRemoteDataSourceImpl(this.dio);

  @override
  Future<VinModel> decodeVin(String vin) async {
    try {
      final response = await dio.get(
        'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/$vin',
        queryParameters: {'format': 'json'},
      );

      if (response.statusCode != 200) {
        throw const ServerFailure('Error communicating with the NHTSA API.');
      }

      final data = response.data;
      if (data == null || data['Results'] == null) {
        throw const InvalidVinFailure('Invalid response from server.');
      }

      final results = data['Results'] as List<dynamic>;

      // Map the results array to a key-value Map for easier extraction
      final Map<String, String?> resultMap = {};
      for (var item in results) {
        final variable = item['Variable'] as String?;
        final value = item['Value'] as String?;
        if (variable != null) {
          resultMap[variable] = value;
        }
      }

      final make = resultMap['Make'];
      final model = resultMap['Model'];
      final modelYear = resultMap['Model Year'];
      final family =
          resultMap['Series'] ??
          resultMap['Model Family'] ??
          resultMap['Family'] ??
          '';
      final bodyClass = resultMap['Body Class'];
      final vehicleType = resultMap['Vehicle Type'];
      final plantCountry = resultMap['Plant Country'];

      final errorCode = resultMap['Error Code'];

      // If make, model and year are all null/empty or error code indicates invalid characters/incomplete
      // Note: Error code "0" means clean, and check digit mismatch (error code 1) is acceptable if we still get details.
      final isInvalidCode =
          errorCode != null &&
          errorCode != '0' &&
          errorCode != '1' &&
          errorCode != '2' &&
          errorCode != '3' &&
          errorCode != '4' &&
          errorCode != '10' && // Off-road warning (still decodes details)
          errorCode != '12'; // Model year warning (still decodes details)

      final hasNoDetails =
          (make == null || make.trim().isEmpty) &&
          (model == null || model.trim().isEmpty) &&
          (modelYear == null || modelYear.trim().isEmpty);

      if (isInvalidCode || hasNoDetails) {
        throw const InvalidVinFailure('Invalid VIN or vehicle not found.');
      }

      return VinModel(
        vin: vin,
        make: make ?? 'Unknown',
        model: model ?? 'Unknown',
        modelYear: modelYear ?? 'Unknown',
        family: family.trim().isEmpty ? 'Unknown' : family,
        bodyClass: bodyClass ?? 'Unknown',
        vehicleType: vehicleType ?? 'Unknown',
        plantCountry: plantCountry ?? 'Unknown',
        rawResults: resultMap,
        scannedAt: DateTime.now(),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const NetworkFailure('No internet connection.');
      }
      throw ServerFailure('Network error: ${e.message}');
    } catch (e) {
      if (e is Failure) rethrow;
      throw ServerFailure('An unexpected error occurred: $e');
    }
  }
}
