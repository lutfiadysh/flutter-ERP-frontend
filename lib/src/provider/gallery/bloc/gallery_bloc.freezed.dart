// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) next,
    required TResult Function(int index) previous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? next,
    TResult? Function(int index)? previous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? next,
    TResult Function(int index)? previous,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Next value) next,
    required TResult Function(_Previous value) previous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Next value)? next,
    TResult? Function(_Previous value)? previous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Next value)? next,
    TResult Function(_Previous value)? previous,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryEventCopyWith<GalleryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryEventCopyWith<$Res> {
  factory $GalleryEventCopyWith(
          GalleryEvent value, $Res Function(GalleryEvent) then) =
      _$GalleryEventCopyWithImpl<$Res, GalleryEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$GalleryEventCopyWithImpl<$Res, $Val extends GalleryEvent>
    implements $GalleryEventCopyWith<$Res> {
  _$GalleryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextImplCopyWith<$Res>
    implements $GalleryEventCopyWith<$Res> {
  factory _$$NextImplCopyWith(
          _$NextImpl value, $Res Function(_$NextImpl) then) =
      __$$NextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NextImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$NextImpl>
    implements _$$NextImplCopyWith<$Res> {
  __$$NextImplCopyWithImpl(_$NextImpl _value, $Res Function(_$NextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NextImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NextImpl implements _Next {
  const _$NextImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GalleryEvent.next(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextImplCopyWith<_$NextImpl> get copyWith =>
      __$$NextImplCopyWithImpl<_$NextImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) next,
    required TResult Function(int index) previous,
  }) {
    return next(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? next,
    TResult? Function(int index)? previous,
  }) {
    return next?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? next,
    TResult Function(int index)? previous,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Next value) next,
    required TResult Function(_Previous value) previous,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Next value)? next,
    TResult? Function(_Previous value)? previous,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Next value)? next,
    TResult Function(_Previous value)? previous,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _Next implements GalleryEvent {
  const factory _Next(final int index) = _$NextImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$NextImplCopyWith<_$NextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousImplCopyWith<$Res>
    implements $GalleryEventCopyWith<$Res> {
  factory _$$PreviousImplCopyWith(
          _$PreviousImpl value, $Res Function(_$PreviousImpl) then) =
      __$$PreviousImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PreviousImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$PreviousImpl>
    implements _$$PreviousImplCopyWith<$Res> {
  __$$PreviousImplCopyWithImpl(
      _$PreviousImpl _value, $Res Function(_$PreviousImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PreviousImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PreviousImpl implements _Previous {
  const _$PreviousImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GalleryEvent.previous(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviousImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviousImplCopyWith<_$PreviousImpl> get copyWith =>
      __$$PreviousImplCopyWithImpl<_$PreviousImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) next,
    required TResult Function(int index) previous,
  }) {
    return previous(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? next,
    TResult? Function(int index)? previous,
  }) {
    return previous?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? next,
    TResult Function(int index)? previous,
    required TResult orElse(),
  }) {
    if (previous != null) {
      return previous(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Next value) next,
    required TResult Function(_Previous value) previous,
  }) {
    return previous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Next value)? next,
    TResult? Function(_Previous value)? previous,
  }) {
    return previous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Next value)? next,
    TResult Function(_Previous value)? previous,
    required TResult orElse(),
  }) {
    if (previous != null) {
      return previous(this);
    }
    return orElse();
  }
}

abstract class _Previous implements GalleryEvent {
  const factory _Previous(final int index) = _$PreviousImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$PreviousImplCopyWith<_$PreviousImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) nextSuccess,
    required TResult Function(int index) previousSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GalleryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) nextSuccess,
    required TResult Function(int index) previousSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? nextSuccess,
    TResult Function(int index)? previousSuccess,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GalleryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NextSuccessImplCopyWith<$Res> {
  factory _$$NextSuccessImplCopyWith(
          _$NextSuccessImpl value, $Res Function(_$NextSuccessImpl) then) =
      __$$NextSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NextSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$NextSuccessImpl>
    implements _$$NextSuccessImplCopyWith<$Res> {
  __$$NextSuccessImplCopyWithImpl(
      _$NextSuccessImpl _value, $Res Function(_$NextSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NextSuccessImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NextSuccessImpl implements _NextSuccess {
  const _$NextSuccessImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GalleryState.nextSuccess(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextSuccessImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextSuccessImplCopyWith<_$NextSuccessImpl> get copyWith =>
      __$$NextSuccessImplCopyWithImpl<_$NextSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) nextSuccess,
    required TResult Function(int index) previousSuccess,
  }) {
    return nextSuccess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
  }) {
    return nextSuccess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    required TResult orElse(),
  }) {
    if (nextSuccess != null) {
      return nextSuccess(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
  }) {
    return nextSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
  }) {
    return nextSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    required TResult orElse(),
  }) {
    if (nextSuccess != null) {
      return nextSuccess(this);
    }
    return orElse();
  }
}

abstract class _NextSuccess implements GalleryState {
  const factory _NextSuccess(final int index) = _$NextSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$NextSuccessImplCopyWith<_$NextSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousSuccessImplCopyWith<$Res> {
  factory _$$PreviousSuccessImplCopyWith(_$PreviousSuccessImpl value,
          $Res Function(_$PreviousSuccessImpl) then) =
      __$$PreviousSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PreviousSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$PreviousSuccessImpl>
    implements _$$PreviousSuccessImplCopyWith<$Res> {
  __$$PreviousSuccessImplCopyWithImpl(
      _$PreviousSuccessImpl _value, $Res Function(_$PreviousSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PreviousSuccessImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PreviousSuccessImpl implements _PreviousSuccess {
  const _$PreviousSuccessImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GalleryState.previousSuccess(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviousSuccessImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviousSuccessImplCopyWith<_$PreviousSuccessImpl> get copyWith =>
      __$$PreviousSuccessImplCopyWithImpl<_$PreviousSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) nextSuccess,
    required TResult Function(int index) previousSuccess,
  }) {
    return previousSuccess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
  }) {
    return previousSuccess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    required TResult orElse(),
  }) {
    if (previousSuccess != null) {
      return previousSuccess(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
  }) {
    return previousSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
  }) {
    return previousSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    required TResult orElse(),
  }) {
    if (previousSuccess != null) {
      return previousSuccess(this);
    }
    return orElse();
  }
}

abstract class _PreviousSuccess implements GalleryState {
  const factory _PreviousSuccess(final int index) = _$PreviousSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$PreviousSuccessImplCopyWith<_$PreviousSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
