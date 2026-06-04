import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/decode_vin.dart';
import 'vin_search_state.dart';

class VinSearchCubit extends Cubit<VinSearchState> {
  final DecodeVinUseCase decodeVinUseCase;

  VinSearchCubit({required this.decodeVinUseCase}) : super(const VinSearchState.initial());

  Future<void> searchVin(String vin) async {
    emit(const VinSearchState.loading());
    final result = await decodeVinUseCase(vin);
    result.fold(
      (failure) => emit(VinSearchState.error(failure.message)),
      (vehicle) => emit(VinSearchState.success(vehicle)),
    );
  }

  void reset() {
    emit(const VinSearchState.initial());
  }
}
