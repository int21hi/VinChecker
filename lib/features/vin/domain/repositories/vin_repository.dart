import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/vin_entity.dart';

abstract class VinRepository {
  Future<Either<Failure, VinEntity>> decodeVin(String vin);
  Future<Either<Failure, List<VinEntity>>> getVinHistory();
  Future<Either<Failure, void>> deleteVinRecord(String vin);
}
