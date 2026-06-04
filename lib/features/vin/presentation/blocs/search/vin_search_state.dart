import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/vin_entity.dart';

part 'vin_search_state.freezed.dart';

@freezed
class VinSearchState with _$VinSearchState {
  const factory VinSearchState.initial() = VinSearchInitial;
  const factory VinSearchState.loading() = VinSearchLoading;
  const factory VinSearchState.success(VinEntity vehicle) = VinSearchSuccess;
  const factory VinSearchState.error(String message) = VinSearchError;
}
