import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_vin_history.dart';
import '../../../domain/usecases/get_vin_history.dart';
import 'vin_history_state.dart';

class VinHistoryCubit extends Cubit<VinHistoryState> {
  final GetVinHistoryUseCase getVinHistoryUseCase;
  final DeleteVinHistoryUseCase deleteVinHistoryUseCase;

  VinHistoryCubit({
    required this.getVinHistoryUseCase,
    required this.deleteVinHistoryUseCase,
  }) : super(const VinHistoryState.initial());

  Future<void> loadHistory() async {
    emit(const VinHistoryState.loading());
    final result = await getVinHistoryUseCase();
    result.fold(
      (failure) => emit(VinHistoryState.error(failure.message)),
      (history) => emit(VinHistoryState.loaded(history)),
    );
  }

  Future<void> deleteRecord(String vin) async {
    // We can show loading or perform optimistic update.
    // Let's do a quick deletion and reload the history.
    final result = await deleteVinHistoryUseCase(vin);
    result.fold(
      (failure) => emit(VinHistoryState.error(failure.message)),
      (_) => loadHistory(),
    );
  }
}
