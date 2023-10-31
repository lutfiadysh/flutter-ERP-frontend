// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_format_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarFormatEvent {
  CalendarFormat get calendarFormat => throw _privateConstructorUsedError;
  Map<DateTime, List<Map<String, dynamic>>> get eventsList =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarFormatEventCopyWith<CalendarFormatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarFormatEventCopyWith<$Res> {
  factory $CalendarFormatEventCopyWith(
          CalendarFormatEvent value, $Res Function(CalendarFormatEvent) then) =
      _$CalendarFormatEventCopyWithImpl<$Res, CalendarFormatEvent>;
  @useResult
  $Res call(
      {CalendarFormat calendarFormat,
      Map<DateTime, List<Map<String, dynamic>>> eventsList});
}

/// @nodoc
class _$CalendarFormatEventCopyWithImpl<$Res, $Val extends CalendarFormatEvent>
    implements $CalendarFormatEventCopyWith<$Res> {
  _$CalendarFormatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarFormat = null,
    Object? eventsList = null,
  }) {
    return _then(_value.copyWith(
      calendarFormat: null == calendarFormat
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      eventsList: null == eventsList
          ? _value.eventsList
          : eventsList // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Map<String, dynamic>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $CalendarFormatEventCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CalendarFormat calendarFormat,
      Map<DateTime, List<Map<String, dynamic>>> eventsList});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CalendarFormatEventCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarFormat = null,
    Object? eventsList = null,
  }) {
    return _then(_$LoadingImpl(
      calendarFormat: null == calendarFormat
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      eventsList: null == eventsList
          ? _value._eventsList
          : eventsList // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Map<String, dynamic>>>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {required this.calendarFormat,
      required final Map<DateTime, List<Map<String, dynamic>>> eventsList})
      : _eventsList = eventsList;

  @override
  final CalendarFormat calendarFormat;
  final Map<DateTime, List<Map<String, dynamic>>> _eventsList;
  @override
  Map<DateTime, List<Map<String, dynamic>>> get eventsList {
    if (_eventsList is EqualUnmodifiableMapView) return _eventsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_eventsList);
  }

  @override
  String toString() {
    return 'CalendarFormatEvent.loading(calendarFormat: $calendarFormat, eventsList: $eventsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.calendarFormat, calendarFormat) ||
                other.calendarFormat == calendarFormat) &&
            const DeepCollectionEquality()
                .equals(other._eventsList, _eventsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, calendarFormat,
      const DeepCollectionEquality().hash(_eventsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)
        loading,
  }) {
    return loading(calendarFormat, eventsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loading,
  }) {
    return loading?.call(calendarFormat, eventsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(calendarFormat, eventsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CalendarFormatEvent {
  const factory _Loading(
      {required final CalendarFormat calendarFormat,
      required final Map<DateTime, List<Map<String, dynamic>>>
          eventsList}) = _$LoadingImpl;

  @override
  CalendarFormat get calendarFormat;
  @override
  Map<DateTime, List<Map<String, dynamic>>> get eventsList;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarFormatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarFormatStateCopyWith<$Res> {
  factory $CalendarFormatStateCopyWith(
          CalendarFormatState value, $Res Function(CalendarFormatState) then) =
      _$CalendarFormatStateCopyWithImpl<$Res, CalendarFormatState>;
}

/// @nodoc
class _$CalendarFormatStateCopyWithImpl<$Res, $Val extends CalendarFormatState>
    implements $CalendarFormatStateCopyWith<$Res> {
  _$CalendarFormatStateCopyWithImpl(this._value, this._then);

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
    extends _$CalendarFormatStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CalendarFormatState.initial()';
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
    required TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
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
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CalendarFormatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CalendarFormat calendarFormat,
      Map<DateTime, List<Map<String, dynamic>>> eventsList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CalendarFormatStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarFormat = null,
    Object? eventsList = null,
  }) {
    return _then(_$LoadedImpl(
      calendarFormat: null == calendarFormat
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      eventsList: null == eventsList
          ? _value._eventsList
          : eventsList // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Map<String, dynamic>>>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.calendarFormat,
      required final Map<DateTime, List<Map<String, dynamic>>> eventsList})
      : _eventsList = eventsList;

  @override
  final CalendarFormat calendarFormat;
  final Map<DateTime, List<Map<String, dynamic>>> _eventsList;
  @override
  Map<DateTime, List<Map<String, dynamic>>> get eventsList {
    if (_eventsList is EqualUnmodifiableMapView) return _eventsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_eventsList);
  }

  @override
  String toString() {
    return 'CalendarFormatState.loaded(calendarFormat: $calendarFormat, eventsList: $eventsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.calendarFormat, calendarFormat) ||
                other.calendarFormat == calendarFormat) &&
            const DeepCollectionEquality()
                .equals(other._eventsList, _eventsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, calendarFormat,
      const DeepCollectionEquality().hash(_eventsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)
        loaded,
  }) {
    return loaded(calendarFormat, eventsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
  }) {
    return loaded?.call(calendarFormat, eventsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CalendarFormat calendarFormat,
            Map<DateTime, List<Map<String, dynamic>>> eventsList)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(calendarFormat, eventsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CalendarFormatState {
  const factory _Loaded(
      {required final CalendarFormat calendarFormat,
      required final Map<DateTime, List<Map<String, dynamic>>>
          eventsList}) = _$LoadedImpl;

  CalendarFormat get calendarFormat;
  Map<DateTime, List<Map<String, dynamic>>> get eventsList;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
