import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/errors/failures.dart';
import '../models/vin_model.dart';

abstract class VinLocalDataSource {
  Future<void> cacheVin(VinModel vinToCache);
  Future<List<VinModel>> getVinHistory();
  Future<void> deleteVinRecord(String vin);
}

class VinLocalDataSourceImpl implements VinLocalDataSource {
  final Box historyBox;

  VinLocalDataSourceImpl(this.historyBox);

  @override
  Future<void> cacheVin(VinModel vinToCache) async {
    try {
      // Store in Hive box as JSON map to avoid adapter dependencies
      await historyBox.put(vinToCache.vin, vinToCache.toJson());
    } catch (e) {
      throw const CacheFailure('Could not save to local history.');
    }
  }

  @override
  Future<List<VinModel>> getVinHistory() async {
    try {
      final List<VinModel> history = [];
      for (final key in historyBox.keys) {
        final rawData = historyBox.get(key);
        if (rawData != null) {
          // Cast raw data safely to Map<String, dynamic>
          final map = Map<String, dynamic>.from(rawData as Map);
          history.add(VinModel.fromJson(map));
        }
      }
      // Sort: newest first (scannedAt descending)
      history.sort((a, b) => b.scannedAt.compareTo(a.scannedAt));
      return history;
    } catch (e) {
      throw const CacheFailure('Could not read local history.');
    }
  }

  @override
  Future<void> deleteVinRecord(String vin) async {
    try {
      await historyBox.delete(vin);
    } catch (e) {
      throw const CacheFailure('Could not delete history record.');
    }
  }
}
