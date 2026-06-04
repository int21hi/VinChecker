import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/vin_entity.dart';
import '../repositories/vin_repository.dart';

class DecodeVinUseCase {
  final VinRepository repository;

  DecodeVinUseCase(this.repository);

  Future<Either<Failure, VinEntity>> call(String vin) {
    return repository.decodeVin(vin);
  }
}
