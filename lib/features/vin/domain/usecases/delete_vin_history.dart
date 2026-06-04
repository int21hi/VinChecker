import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/vin_repository.dart';

class DeleteVinHistoryUseCase {
  final VinRepository repository;

  DeleteVinHistoryUseCase(this.repository);

  Future<Either<Failure, void>> call(String vin) {
    return repository.deleteVinRecord(vin);
  }
}
