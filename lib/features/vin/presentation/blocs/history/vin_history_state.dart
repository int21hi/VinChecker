import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/vin_entity.dart';

part 'vin_history_state.freezed.dart';

@freezed
class VinHistoryState with _$VinHistoryState {
  const factory VinHistoryState.initial() = VinHistoryInitial;
  const factory VinHistoryState.loading() = VinHistoryLoading;
  const factory VinHistoryState.loaded(List<VinEntity> history) = VinHistoryLoaded;
  const factory VinHistoryState.error(String message) = VinHistoryError;
}
