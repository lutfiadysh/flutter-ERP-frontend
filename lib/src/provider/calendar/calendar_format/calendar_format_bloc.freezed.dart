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
abstract class _$$_LoadingCopyWith<$Res>
    implements $CalendarFormatEventCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CalendarFormat calendarFormat,
      Map<DateTime, List<Map<String, dynamic>>> eventsList});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CalendarFormatEventCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarFormat = null,
    Object? eventsList = null,
  }) {
    return _then(_$_Loading(
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

class _$_Loading implements _Loading {
  const _$_Loading(
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
            other is _$_Loading &&
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
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

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
          eventsList}) = _$_Loading;

  @override
  CalendarFormat get calendarFormat;
  @override
  Map<DateTime, List<Map<String, dynamic>>> get eventsList;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CalendarFormatStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CalendarFormatState.initial()';
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CalendarFormat calendarFormat,
      Map<DateTime, List<Map<String, dynamic>>> eventsList});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$CalendarFormatStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarFormat = null,
    Object? eventsList = null,
  }) {
    return _then(_$_Loaded(
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

class _$_Loaded implements _Loaded {
  const _$_Loaded(
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
            other is _$_Loaded &&
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
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

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
          eventsList}) = _$_Loaded;

  CalendarFormat get calendarFormat;
  Map<DateTime, List<Map<String, dynamic>>> get eventsList;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
