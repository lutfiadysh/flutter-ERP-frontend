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
abstract class _$$_NextCopyWith<$Res> implements $GalleryEventCopyWith<$Res> {
  factory _$$_NextCopyWith(_$_Next value, $Res Function(_$_Next) then) =
      __$$_NextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_NextCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$_Next>
    implements _$$_NextCopyWith<$Res> {
  __$$_NextCopyWithImpl(_$_Next _value, $Res Function(_$_Next) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_Next(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Next implements _Next {
  const _$_Next(this.index);

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
            other is _$_Next &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextCopyWith<_$_Next> get copyWith =>
      __$$_NextCopyWithImpl<_$_Next>(this, _$identity);

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
  const factory _Next(final int index) = _$_Next;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_NextCopyWith<_$_Next> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PreviousCopyWith<$Res>
    implements $GalleryEventCopyWith<$Res> {
  factory _$$_PreviousCopyWith(
          _$_Previous value, $Res Function(_$_Previous) then) =
      __$$_PreviousCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_PreviousCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$_Previous>
    implements _$$_PreviousCopyWith<$Res> {
  __$$_PreviousCopyWithImpl(
      _$_Previous _value, $Res Function(_$_Previous) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_Previous(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Previous implements _Previous {
  const _$_Previous(this.index);

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
            other is _$_Previous &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreviousCopyWith<_$_Previous> get copyWith =>
      __$$_PreviousCopyWithImpl<_$_Previous>(this, _$identity);

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
  const factory _Previous(final int index) = _$_Previous;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_PreviousCopyWith<_$_Previous> get copyWith =>
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GalleryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_NextSuccessCopyWith<$Res> {
  factory _$$_NextSuccessCopyWith(
          _$_NextSuccess value, $Res Function(_$_NextSuccess) then) =
      __$$_NextSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_NextSuccessCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$_NextSuccess>
    implements _$$_NextSuccessCopyWith<$Res> {
  __$$_NextSuccessCopyWithImpl(
      _$_NextSuccess _value, $Res Function(_$_NextSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_NextSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NextSuccess implements _NextSuccess {
  const _$_NextSuccess(this.index);

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
            other is _$_NextSuccess &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextSuccessCopyWith<_$_NextSuccess> get copyWith =>
      __$$_NextSuccessCopyWithImpl<_$_NextSuccess>(this, _$identity);

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
  const factory _NextSuccess(final int index) = _$_NextSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_NextSuccessCopyWith<_$_NextSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PreviousSuccessCopyWith<$Res> {
  factory _$$_PreviousSuccessCopyWith(
          _$_PreviousSuccess value, $Res Function(_$_PreviousSuccess) then) =
      __$$_PreviousSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_PreviousSuccessCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$_PreviousSuccess>
    implements _$$_PreviousSuccessCopyWith<$Res> {
  __$$_PreviousSuccessCopyWithImpl(
      _$_PreviousSuccess _value, $Res Function(_$_PreviousSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_PreviousSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PreviousSuccess implements _PreviousSuccess {
  const _$_PreviousSuccess(this.index);

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
            other is _$_PreviousSuccess &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreviousSuccessCopyWith<_$_PreviousSuccess> get copyWith =>
      __$$_PreviousSuccessCopyWithImpl<_$_PreviousSuccess>(this, _$identity);

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
  const factory _PreviousSuccess(final int index) = _$_PreviousSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_PreviousSuccessCopyWith<_$_PreviousSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
