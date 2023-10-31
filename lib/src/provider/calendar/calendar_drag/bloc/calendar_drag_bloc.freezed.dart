// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_drag_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarDragEvent {
  bool get dragStarted => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool dragStarted) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool dragStarted)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool dragStarted)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarDragEventCopyWith<CalendarDragEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDragEventCopyWith<$Res> {
  factory $CalendarDragEventCopyWith(
          CalendarDragEvent value, $Res Function(CalendarDragEvent) then) =
      _$CalendarDragEventCopyWithImpl<$Res, CalendarDragEvent>;
  @useResult
  $Res call({bool dragStarted});
}

/// @nodoc
class _$CalendarDragEventCopyWithImpl<$Res, $Val extends CalendarDragEvent>
    implements $CalendarDragEventCopyWith<$Res> {
  _$CalendarDragEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dragStarted = null,
  }) {
    return _then(_value.copyWith(
      dragStarted: null == dragStarted
          ? _value.dragStarted
          : dragStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res>
    implements $CalendarDragEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool dragStarted});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CalendarDragEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dragStarted = null,
  }) {
    return _then(_$StartedImpl(
      dragStarted: null == dragStarted
          ? _value.dragStarted
          : dragStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl({required this.dragStarted});

  @override
  final bool dragStarted;

  @override
  String toString() {
    return 'CalendarDragEvent.started(dragStarted: $dragStarted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.dragStarted, dragStarted) ||
                other.dragStarted == dragStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dragStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool dragStarted) started,
  }) {
    return started(dragStarted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool dragStarted)? started,
  }) {
    return started?.call(dragStarted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool dragStarted)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(dragStarted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CalendarDragEvent {
  const factory _Started({required final bool dragStarted}) = _$StartedImpl;

  @override
  bool get dragStarted;
  @override
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarDragState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool dragStarted) dragStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool dragStarted)? dragStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool dragStarted)? dragStart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DragStart value) dragStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DragStart value)? dragStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DragStart value)? dragStart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDragStateCopyWith<$Res> {
  factory $CalendarDragStateCopyWith(
          CalendarDragState value, $Res Function(CalendarDragState) then) =
      _$CalendarDragStateCopyWithImpl<$Res, CalendarDragState>;
}

/// @nodoc
class _$CalendarDragStateCopyWithImpl<$Res, $Val extends CalendarDragState>
    implements $CalendarDragStateCopyWith<$Res> {
  _$CalendarDragStateCopyWithImpl(this._value, this._then);

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
    extends _$CalendarDragStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CalendarDragState.initial()';
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
    required TResult Function(bool dragStarted) dragStart,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool dragStarted)? dragStart,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool dragStarted)? dragStart,
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
    required TResult Function(_DragStart value) dragStart,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DragStart value)? dragStart,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DragStart value)? dragStart,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CalendarDragState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DragStartImplCopyWith<$Res> {
  factory _$$DragStartImplCopyWith(
          _$DragStartImpl value, $Res Function(_$DragStartImpl) then) =
      __$$DragStartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool dragStarted});
}

/// @nodoc
class __$$DragStartImplCopyWithImpl<$Res>
    extends _$CalendarDragStateCopyWithImpl<$Res, _$DragStartImpl>
    implements _$$DragStartImplCopyWith<$Res> {
  __$$DragStartImplCopyWithImpl(
      _$DragStartImpl _value, $Res Function(_$DragStartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dragStarted = null,
  }) {
    return _then(_$DragStartImpl(
      dragStarted: null == dragStarted
          ? _value.dragStarted
          : dragStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DragStartImpl implements _DragStart {
  const _$DragStartImpl({required this.dragStarted});

  @override
  final bool dragStarted;

  @override
  String toString() {
    return 'CalendarDragState.dragStart(dragStarted: $dragStarted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragStartImpl &&
            (identical(other.dragStarted, dragStarted) ||
                other.dragStarted == dragStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dragStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DragStartImplCopyWith<_$DragStartImpl> get copyWith =>
      __$$DragStartImplCopyWithImpl<_$DragStartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool dragStarted) dragStart,
  }) {
    return dragStart(dragStarted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool dragStarted)? dragStart,
  }) {
    return dragStart?.call(dragStarted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool dragStarted)? dragStart,
    required TResult orElse(),
  }) {
    if (dragStart != null) {
      return dragStart(dragStarted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DragStart value) dragStart,
  }) {
    return dragStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DragStart value)? dragStart,
  }) {
    return dragStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DragStart value)? dragStart,
    required TResult orElse(),
  }) {
    if (dragStart != null) {
      return dragStart(this);
    }
    return orElse();
  }
}

abstract class _DragStart implements CalendarDragState {
  const factory _DragStart({required final bool dragStarted}) = _$DragStartImpl;

  bool get dragStarted;
  @JsonKey(ignore: true)
  _$$DragStartImplCopyWith<_$DragStartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
