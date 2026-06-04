import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/vin_entity.dart';
import '../../domain/repositories/vin_repository.dart';
import '../datasources/vin_local_data_source.dart';
import '../datasources/vin_remote_data_source.dart';

class VinRepositoryImpl implements VinRepository {
  final VinRemoteDataSource remoteDataSource;
  final VinLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  VinRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VinEntity>> decodeVin(String vin) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteVin = await remoteDataSource.decodeVin(vin);
        await localDataSource.cacheVin(remoteVin);
        return Right(remoteVin);
      } on Failure catch (failure) {
        return Left(failure);
      } catch (e) {
        return Left(ServerFailure('An unexpected error occurred: $e'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection.'));
    }
  }

  @override
  Future<Either<Failure, List<VinEntity>>> getVinHistory() async {
    try {
      final localHistory = await localDataSource.getVinHistory();
      return Right(localHistory);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CacheFailure('Error reading history: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteVinRecord(String vin) async {
    try {
      await localDataSource.deleteVinRecord(vin);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(CacheFailure('Error deleting history item: $e'));
    }
  }
}
