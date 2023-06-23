// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarouselEvent {
  int get slideOnlyindex => throw _privateConstructorUsedError;
  int get controlsIndex => throw _privateConstructorUsedError;
  int get indicatorIndex => throw _privateConstructorUsedError;
  int get captionIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int slideOnlyindex, int controlsIndex,
            int indicatorIndex, int captionIndex)
        pageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChange value) pageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChange value)? pageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarouselEventCopyWith<CarouselEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselEventCopyWith<$Res> {
  factory $CarouselEventCopyWith(
          CarouselEvent value, $Res Function(CarouselEvent) then) =
      _$CarouselEventCopyWithImpl<$Res, CarouselEvent>;
  @useResult
  $Res call(
      {int slideOnlyindex,
      int controlsIndex,
      int indicatorIndex,
      int captionIndex});
}

/// @nodoc
class _$CarouselEventCopyWithImpl<$Res, $Val extends CarouselEvent>
    implements $CarouselEventCopyWith<$Res> {
  _$CarouselEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slideOnlyindex = null,
    Object? controlsIndex = null,
    Object? indicatorIndex = null,
    Object? captionIndex = null,
  }) {
    return _then(_value.copyWith(
      slideOnlyindex: null == slideOnlyindex
          ? _value.slideOnlyindex
          : slideOnlyindex // ignore: cast_nullable_to_non_nullable
              as int,
      controlsIndex: null == controlsIndex
          ? _value.controlsIndex
          : controlsIndex // ignore: cast_nullable_to_non_nullable
              as int,
      indicatorIndex: null == indicatorIndex
          ? _value.indicatorIndex
          : indicatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      captionIndex: null == captionIndex
          ? _value.captionIndex
          : captionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageChangeCopyWith<$Res>
    implements $CarouselEventCopyWith<$Res> {
  factory _$$_PageChangeCopyWith(
          _$_PageChange value, $Res Function(_$_PageChange) then) =
      __$$_PageChangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int slideOnlyindex,
      int controlsIndex,
      int indicatorIndex,
      int captionIndex});
}

/// @nodoc
class __$$_PageChangeCopyWithImpl<$Res>
    extends _$CarouselEventCopyWithImpl<$Res, _$_PageChange>
    implements _$$_PageChangeCopyWith<$Res> {
  __$$_PageChangeCopyWithImpl(
      _$_PageChange _value, $Res Function(_$_PageChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slideOnlyindex = null,
    Object? controlsIndex = null,
    Object? indicatorIndex = null,
    Object? captionIndex = null,
  }) {
    return _then(_$_PageChange(
      null == slideOnlyindex
          ? _value.slideOnlyindex
          : slideOnlyindex // ignore: cast_nullable_to_non_nullable
              as int,
      null == controlsIndex
          ? _value.controlsIndex
          : controlsIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == indicatorIndex
          ? _value.indicatorIndex
          : indicatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == captionIndex
          ? _value.captionIndex
          : captionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageChange implements _PageChange {
  const _$_PageChange(this.slideOnlyindex, this.controlsIndex,
      this.indicatorIndex, this.captionIndex);

  @override
  final int slideOnlyindex;
  @override
  final int controlsIndex;
  @override
  final int indicatorIndex;
  @override
  final int captionIndex;

  @override
  String toString() {
    return 'CarouselEvent.pageChange(slideOnlyindex: $slideOnlyindex, controlsIndex: $controlsIndex, indicatorIndex: $indicatorIndex, captionIndex: $captionIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageChange &&
            (identical(other.slideOnlyindex, slideOnlyindex) ||
                other.slideOnlyindex == slideOnlyindex) &&
            (identical(other.controlsIndex, controlsIndex) ||
                other.controlsIndex == controlsIndex) &&
            (identical(other.indicatorIndex, indicatorIndex) ||
                other.indicatorIndex == indicatorIndex) &&
            (identical(other.captionIndex, captionIndex) ||
                other.captionIndex == captionIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageChangeCopyWith<_$_PageChange> get copyWith =>
      __$$_PageChangeCopyWithImpl<_$_PageChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int slideOnlyindex, int controlsIndex,
            int indicatorIndex, int captionIndex)
        pageChange,
  }) {
    return pageChange(
        slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChange,
  }) {
    return pageChange?.call(
        slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChange,
    required TResult orElse(),
  }) {
    if (pageChange != null) {
      return pageChange(
          slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChange value) pageChange,
  }) {
    return pageChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChange value)? pageChange,
  }) {
    return pageChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChange value)? pageChange,
    required TResult orElse(),
  }) {
    if (pageChange != null) {
      return pageChange(this);
    }
    return orElse();
  }
}

abstract class _PageChange implements CarouselEvent {
  const factory _PageChange(final int slideOnlyindex, final int controlsIndex,
      final int indicatorIndex, final int captionIndex) = _$_PageChange;

  @override
  int get slideOnlyindex;
  @override
  int get controlsIndex;
  @override
  int get indicatorIndex;
  @override
  int get captionIndex;
  @override
  @JsonKey(ignore: true)
  _$$_PageChangeCopyWith<_$_PageChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CarouselState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int slideOnlyindex, int controlsIndex,
            int indicatorIndex, int captionIndex)
        pageChangeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageChangeSuccess value) pageChangeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageChangeSuccess value)? pageChangeSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageChangeSuccess value)? pageChangeSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselStateCopyWith<$Res> {
  factory $CarouselStateCopyWith(
          CarouselState value, $Res Function(CarouselState) then) =
      _$CarouselStateCopyWithImpl<$Res, CarouselState>;
}

/// @nodoc
class _$CarouselStateCopyWithImpl<$Res, $Val extends CarouselState>
    implements $CarouselStateCopyWith<$Res> {
  _$CarouselStateCopyWithImpl(this._value, this._then);

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
    extends _$CarouselStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CarouselState.initial()';
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
    required TResult Function(int slideOnlyindex, int controlsIndex,
            int indicatorIndex, int captionIndex)
        pageChangeSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
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
    required TResult Function(_PageChangeSuccess value) pageChangeSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageChangeSuccess value)? pageChangeSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageChangeSuccess value)? pageChangeSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CarouselState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_PageChangeSuccessCopyWith<$Res> {
  factory _$$_PageChangeSuccessCopyWith(_$_PageChangeSuccess value,
          $Res Function(_$_PageChangeSuccess) then) =
      __$$_PageChangeSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int slideOnlyindex,
      int controlsIndex,
      int indicatorIndex,
      int captionIndex});
}

/// @nodoc
class __$$_PageChangeSuccessCopyWithImpl<$Res>
    extends _$CarouselStateCopyWithImpl<$Res, _$_PageChangeSuccess>
    implements _$$_PageChangeSuccessCopyWith<$Res> {
  __$$_PageChangeSuccessCopyWithImpl(
      _$_PageChangeSuccess _value, $Res Function(_$_PageChangeSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slideOnlyindex = null,
    Object? controlsIndex = null,
    Object? indicatorIndex = null,
    Object? captionIndex = null,
  }) {
    return _then(_$_PageChangeSuccess(
      null == slideOnlyindex
          ? _value.slideOnlyindex
          : slideOnlyindex // ignore: cast_nullable_to_non_nullable
              as int,
      null == controlsIndex
          ? _value.controlsIndex
          : controlsIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == indicatorIndex
          ? _value.indicatorIndex
          : indicatorIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == captionIndex
          ? _value.captionIndex
          : captionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PageChangeSuccess implements _PageChangeSuccess {
  const _$_PageChangeSuccess(this.slideOnlyindex, this.controlsIndex,
      this.indicatorIndex, this.captionIndex);

  @override
  final int slideOnlyindex;
  @override
  final int controlsIndex;
  @override
  final int indicatorIndex;
  @override
  final int captionIndex;

  @override
  String toString() {
    return 'CarouselState.pageChangeSuccess(slideOnlyindex: $slideOnlyindex, controlsIndex: $controlsIndex, indicatorIndex: $indicatorIndex, captionIndex: $captionIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageChangeSuccess &&
            (identical(other.slideOnlyindex, slideOnlyindex) ||
                other.slideOnlyindex == slideOnlyindex) &&
            (identical(other.controlsIndex, controlsIndex) ||
                other.controlsIndex == controlsIndex) &&
            (identical(other.indicatorIndex, indicatorIndex) ||
                other.indicatorIndex == indicatorIndex) &&
            (identical(other.captionIndex, captionIndex) ||
                other.captionIndex == captionIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageChangeSuccessCopyWith<_$_PageChangeSuccess> get copyWith =>
      __$$_PageChangeSuccessCopyWithImpl<_$_PageChangeSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int slideOnlyindex, int controlsIndex,
            int indicatorIndex, int captionIndex)
        pageChangeSuccess,
  }) {
    return pageChangeSuccess(
        slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
  }) {
    return pageChangeSuccess?.call(
        slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int slideOnlyindex, int controlsIndex, int indicatorIndex,
            int captionIndex)?
        pageChangeSuccess,
    required TResult orElse(),
  }) {
    if (pageChangeSuccess != null) {
      return pageChangeSuccess(
          slideOnlyindex, controlsIndex, indicatorIndex, captionIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PageChangeSuccess value) pageChangeSuccess,
  }) {
    return pageChangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PageChangeSuccess value)? pageChangeSuccess,
  }) {
    return pageChangeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PageChangeSuccess value)? pageChangeSuccess,
    required TResult orElse(),
  }) {
    if (pageChangeSuccess != null) {
      return pageChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class _PageChangeSuccess implements CarouselState {
  const factory _PageChangeSuccess(
      final int slideOnlyindex,
      final int controlsIndex,
      final int indicatorIndex,
      final int captionIndex) = _$_PageChangeSuccess;

  int get slideOnlyindex;
  int get controlsIndex;
  int get indicatorIndex;
  int get captionIndex;
  @JsonKey(ignore: true)
  _$$_PageChangeSuccessCopyWith<_$_PageChangeSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
