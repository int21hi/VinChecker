import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/vin_entity.dart';
import '../repositories/vin_repository.dart';

class GetVinHistoryUseCase {
  final VinRepository repository;

  GetVinHistoryUseCase(this.repository);

  Future<Either<Failure, List<VinEntity>>> call() {
    return repository.getVinHistory();
  }
}
