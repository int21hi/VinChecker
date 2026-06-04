// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vin_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VinSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VinEntity vehicle) success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VinEntity vehicle)? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VinEntity vehicle)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VinSearchInitial value) initial,
    required TResult Function(VinSearchLoading value) loading,
    required TResult Function(VinSearchSuccess value) success,
    required TResult Function(VinSearchError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VinSearchInitial value)? initial,
    TResult? Function(VinSearchLoading value)? loading,
    TResult? Function(VinSearchSuccess value)? success,
    TResult? Function(VinSearchError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VinSearchInitial value)? initial,
    TResult Function(VinSearchLoading value)? loading,
    TResult Function(VinSearchSuccess value)? success,
    TResult Function(VinSearchError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VinSearchStateCopyWith<$Res> {
  factory $VinSearchStateCopyWith(
    VinSearchState value,
    $Res Function(VinSearchState) then,
  ) = _$VinSearchStateCopyWithImpl<$Res, VinSearchState>;
}

/// @nodoc
class _$VinSearchStateCopyWithImpl<$Res, $Val extends VinSearchState>
    implements $VinSearchStateCopyWith<$Res> {
  _$VinSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VinSearchInitialImplCopyWith<$Res> {
  factory _$$VinSearchInitialImplCopyWith(
    _$VinSearchInitialImpl value,
    $Res Function(_$VinSearchInitialImpl) then,
  ) = __$$VinSearchInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VinSearchInitialImplCopyWithImpl<$Res>
    extends _$VinSearchStateCopyWithImpl<$Res, _$VinSearchInitialImpl>
    implements _$$VinSearchInitialImplCopyWith<$Res> {
  __$$VinSearchInitialImplCopyWithImpl(
    _$VinSearchInitialImpl _value,
    $Res Function(_$VinSearchInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VinSearchInitialImpl implements VinSearchInitial {
  const _$VinSearchInitialImpl();

  @override
  String toString() {
    return 'VinSearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VinSearchInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VinEntity vehicle) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VinEntity vehicle)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VinEntity vehicle)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VinSearchInitial value) initial,
    required TResult Function(VinSearchLoading value) loading,
    required TResult Function(VinSearchSuccess value) success,
    required TResult Function(VinSearchError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VinSearchInitial value)? initial,
    TResult? Function(VinSearchLoading value)? loading,
    TResult? Function(VinSearchSuccess value)? success,
    TResult? Function(VinSearchError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VinSearchInitial value)? initial,
    TResult Function(VinSearchLoading value)? loading,
    TResult Function(VinSearchSuccess value)? success,
    TResult Function(VinSearchError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VinSearchInitial implements VinSearchState {
  const factory VinSearchInitial() = _$VinSearchInitialImpl;
}

/// @nodoc
abstract class _$$VinSearchLoadingImplCopyWith<$Res> {
  factory _$$VinSearchLoadingImplCopyWith(
    _$VinSearchLoadingImpl value,
    $Res Function(_$VinSearchLoadingImpl) then,
  ) = __$$VinSearchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VinSearchLoadingImplCopyWithImpl<$Res>
    extends _$VinSearchStateCopyWithImpl<$Res, _$VinSearchLoadingImpl>
    implements _$$VinSearchLoadingImplCopyWith<$Res> {
  __$$VinSearchLoadingImplCopyWithImpl(
    _$VinSearchLoadingImpl _value,
    $Res Function(_$VinSearchLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VinSearchLoadingImpl implements VinSearchLoading {
  const _$VinSearchLoadingImpl();

  @override
  String toString() {
    return 'VinSearchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VinSearchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VinEntity vehicle) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VinEntity vehicle)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VinEntity vehicle)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VinSearchInitial value) initial,
    required TResult Function(VinSearchLoading value) loading,
    required TResult Function(VinSearchSuccess value) success,
    required TResult Function(VinSearchError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VinSearchInitial value)? initial,
    TResult? Function(VinSearchLoading value)? loading,
    TResult? Function(VinSearchSuccess value)? success,
    TResult? Function(VinSearchError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VinSearchInitial value)? initial,
    TResult Function(VinSearchLoading value)? loading,
    TResult Function(VinSearchSuccess value)? success,
    TResult Function(VinSearchError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class VinSearchLoading implements VinSearchState {
  const factory VinSearchLoading() = _$VinSearchLoadingImpl;
}

/// @nodoc
abstract class _$$VinSearchSuccessImplCopyWith<$Res> {
  factory _$$VinSearchSuccessImplCopyWith(
    _$VinSearchSuccessImpl value,
    $Res Function(_$VinSearchSuccessImpl) then,
  ) = __$$VinSearchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VinEntity vehicle});
}

/// @nodoc
class __$$VinSearchSuccessImplCopyWithImpl<$Res>
    extends _$VinSearchStateCopyWithImpl<$Res, _$VinSearchSuccessImpl>
    implements _$$VinSearchSuccessImplCopyWith<$Res> {
  __$$VinSearchSuccessImplCopyWithImpl(
    _$VinSearchSuccessImpl _value,
    $Res Function(_$VinSearchSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? vehicle = null}) {
    return _then(
      _$VinSearchSuccessImpl(
        null == vehicle
            ? _value.vehicle
            : vehicle // ignore: cast_nullable_to_non_nullable
                  as VinEntity,
      ),
    );
  }
}

/// @nodoc

class _$VinSearchSuccessImpl implements VinSearchSuccess {
  const _$VinSearchSuccessImpl(this.vehicle);

  @override
  final VinEntity vehicle;

  @override
  String toString() {
    return 'VinSearchState.success(vehicle: $vehicle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VinSearchSuccessImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicle);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VinSearchSuccessImplCopyWith<_$VinSearchSuccessImpl> get copyWith =>
      __$$VinSearchSuccessImplCopyWithImpl<_$VinSearchSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VinEntity vehicle) success,
    required TResult Function(String message) error,
  }) {
    return success(vehicle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VinEntity vehicle)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(vehicle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VinEntity vehicle)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(vehicle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VinSearchInitial value) initial,
    required TResult Function(VinSearchLoading value) loading,
    required TResult Function(VinSearchSuccess value) success,
    required TResult Function(VinSearchError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VinSearchInitial value)? initial,
    TResult? Function(VinSearchLoading value)? loading,
    TResult? Function(VinSearchSuccess value)? success,
    TResult? Function(VinSearchError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VinSearchInitial value)? initial,
    TResult Function(VinSearchLoading value)? loading,
    TResult Function(VinSearchSuccess value)? success,
    TResult Function(VinSearchError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class VinSearchSuccess implements VinSearchState {
  const factory VinSearchSuccess(final VinEntity vehicle) =
      _$VinSearchSuccessImpl;

  VinEntity get vehicle;

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VinSearchSuccessImplCopyWith<_$VinSearchSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VinSearchErrorImplCopyWith<$Res> {
  factory _$$VinSearchErrorImplCopyWith(
    _$VinSearchErrorImpl value,
    $Res Function(_$VinSearchErrorImpl) then,
  ) = __$$VinSearchErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VinSearchErrorImplCopyWithImpl<$Res>
    extends _$VinSearchStateCopyWithImpl<$Res, _$VinSearchErrorImpl>
    implements _$$VinSearchErrorImplCopyWith<$Res> {
  __$$VinSearchErrorImplCopyWithImpl(
    _$VinSearchErrorImpl _value,
    $Res Function(_$VinSearchErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$VinSearchErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VinSearchErrorImpl implements VinSearchError {
  const _$VinSearchErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VinSearchState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VinSearchErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VinSearchErrorImplCopyWith<_$VinSearchErrorImpl> get copyWith =>
      __$$VinSearchErrorImplCopyWithImpl<_$VinSearchErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(VinEntity vehicle) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(VinEntity vehicle)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(VinEntity vehicle)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VinSearchInitial value) initial,
    required TResult Function(VinSearchLoading value) loading,
    required TResult Function(VinSearchSuccess value) success,
    required TResult Function(VinSearchError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VinSearchInitial value)? initial,
    TResult? Function(VinSearchLoading value)? loading,
    TResult? Function(VinSearchSuccess value)? success,
    TResult? Function(VinSearchError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VinSearchInitial value)? initial,
    TResult Function(VinSearchLoading value)? loading,
    TResult Function(VinSearchSuccess value)? success,
    TResult Function(VinSearchError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class VinSearchError implements VinSearchState {
  const factory VinSearchError(final String message) = _$VinSearchErrorImpl;

  String get message;

  /// Create a copy of VinSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VinSearchErrorImplCopyWith<_$VinSearchErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
