// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_elements_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormElementsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormElementsEventCopyWith<$Res> {
  factory $FormElementsEventCopyWith(
          FormElementsEvent value, $Res Function(FormElementsEvent) then) =
      _$FormElementsEventCopyWithImpl<$Res, FormElementsEvent>;
}

/// @nodoc
class _$FormElementsEventCopyWithImpl<$Res, $Val extends FormElementsEvent>
    implements $FormElementsEventCopyWith<$Res> {
  _$FormElementsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementImplCopyWith<$Res> {
  factory _$$IncrementImplCopyWith(
          _$IncrementImpl value, $Res Function(_$IncrementImpl) then) =
      __$$IncrementImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$IncrementImplCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$IncrementImpl>
    implements _$$IncrementImplCopyWith<$Res> {
  __$$IncrementImplCopyWithImpl(
      _$IncrementImpl _value, $Res Function(_$IncrementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$IncrementImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementImpl implements _Increment {
  const _$IncrementImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FormElementsEvent.increment(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementImplCopyWith<_$IncrementImpl> get copyWith =>
      __$$IncrementImplCopyWithImpl<_$IncrementImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) {
    return increment(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) {
    return increment?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) {
    return increment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) {
    return increment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) {
    if (increment != null) {
      return increment(this);
    }
    return orElse();
  }
}

abstract class _Increment implements FormElementsEvent {
  const factory _Increment(final int value) = _$IncrementImpl;

  int get value;
  @JsonKey(ignore: true)
  _$$IncrementImplCopyWith<_$IncrementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementImplCopyWith<$Res> {
  factory _$$DecrementImplCopyWith(
          _$DecrementImpl value, $Res Function(_$DecrementImpl) then) =
      __$$DecrementImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$DecrementImplCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$DecrementImpl>
    implements _$$DecrementImplCopyWith<$Res> {
  __$$DecrementImplCopyWithImpl(
      _$DecrementImpl _value, $Res Function(_$DecrementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DecrementImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecrementImpl implements _Decrement {
  const _$DecrementImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FormElementsEvent.decrement(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementImplCopyWith<_$DecrementImpl> get copyWith =>
      __$$DecrementImplCopyWithImpl<_$DecrementImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) {
    return decrement(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) {
    return decrement?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) {
    return decrement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) {
    return decrement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) {
    if (decrement != null) {
      return decrement(this);
    }
    return orElse();
  }
}

abstract class _Decrement implements FormElementsEvent {
  const factory _Decrement(final int value) = _$DecrementImpl;

  int get value;
  @JsonKey(ignore: true)
  _$$DecrementImplCopyWith<_$DecrementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatePickerImplCopyWith<$Res> {
  factory _$$DatePickerImplCopyWith(
          _$DatePickerImpl value, $Res Function(_$DatePickerImpl) then) =
      __$$DatePickerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dateAndtime});
}

/// @nodoc
class __$$DatePickerImplCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$DatePickerImpl>
    implements _$$DatePickerImplCopyWith<$Res> {
  __$$DatePickerImplCopyWithImpl(
      _$DatePickerImpl _value, $Res Function(_$DatePickerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateAndtime = null,
  }) {
    return _then(_$DatePickerImpl(
      null == dateAndtime
          ? _value.dateAndtime
          : dateAndtime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatePickerImpl implements _DatePicker {
  const _$DatePickerImpl(this.dateAndtime);

  @override
  final String dateAndtime;

  @override
  String toString() {
    return 'FormElementsEvent.datePicker(dateAndtime: $dateAndtime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatePickerImpl &&
            (identical(other.dateAndtime, dateAndtime) ||
                other.dateAndtime == dateAndtime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateAndtime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatePickerImplCopyWith<_$DatePickerImpl> get copyWith =>
      __$$DatePickerImplCopyWithImpl<_$DatePickerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) {
    return datePicker(dateAndtime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) {
    return datePicker?.call(dateAndtime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) {
    if (datePicker != null) {
      return datePicker(dateAndtime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) {
    return datePicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) {
    return datePicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) {
    if (datePicker != null) {
      return datePicker(this);
    }
    return orElse();
  }
}

abstract class _DatePicker implements FormElementsEvent {
  const factory _DatePicker(final String dateAndtime) = _$DatePickerImpl;

  String get dateAndtime;
  @JsonKey(ignore: true)
  _$$DatePickerImplCopyWith<_$DatePickerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorPickerImplCopyWith<$Res> {
  factory _$$ColorPickerImplCopyWith(
          _$ColorPickerImpl value, $Res Function(_$ColorPickerImpl) then) =
      __$$ColorPickerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color color});
}

/// @nodoc
class __$$ColorPickerImplCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$ColorPickerImpl>
    implements _$$ColorPickerImplCopyWith<$Res> {
  __$$ColorPickerImplCopyWithImpl(
      _$ColorPickerImpl _value, $Res Function(_$ColorPickerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$ColorPickerImpl(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColorPickerImpl implements _ColorPicker {
  const _$ColorPickerImpl(this.color);

  @override
  final Color color;

  @override
  String toString() {
    return 'FormElementsEvent.colorPicker(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorPickerImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorPickerImplCopyWith<_$ColorPickerImpl> get copyWith =>
      __$$ColorPickerImplCopyWithImpl<_$ColorPickerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) {
    return colorPicker(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) {
    return colorPicker?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) {
    if (colorPicker != null) {
      return colorPicker(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) {
    return colorPicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) {
    return colorPicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) {
    if (colorPicker != null) {
      return colorPicker(this);
    }
    return orElse();
  }
}

abstract class _ColorPicker implements FormElementsEvent {
  const factory _ColorPicker(final Color color) = _$ColorPickerImpl;

  Color get color;
  @JsonKey(ignore: true)
  _$$ColorPickerImplCopyWith<_$ColorPickerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DropDownImplCopyWith<$Res> {
  factory _$$DropDownImplCopyWith(
          _$DropDownImpl value, $Res Function(_$DropDownImpl) then) =
      __$$DropDownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$DropDownImplCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$DropDownImpl>
    implements _$$DropDownImplCopyWith<$Res> {
  __$$DropDownImplCopyWithImpl(
      _$DropDownImpl _value, $Res Function(_$DropDownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DropDownImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DropDownImpl implements _DropDown {
  const _$DropDownImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FormElementsEvent.dropDown(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDownImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDownImplCopyWith<_$DropDownImpl> get copyWith =>
      __$$DropDownImplCopyWithImpl<_$DropDownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) increment,
    required TResult Function(int value) decrement,
    required TResult Function(String dateAndtime) datePicker,
    required TResult Function(Color color) colorPicker,
    required TResult Function(String value) dropDown,
  }) {
    return dropDown(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? increment,
    TResult? Function(int value)? decrement,
    TResult? Function(String dateAndtime)? datePicker,
    TResult? Function(Color color)? colorPicker,
    TResult? Function(String value)? dropDown,
  }) {
    return dropDown?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? increment,
    TResult Function(int value)? decrement,
    TResult Function(String dateAndtime)? datePicker,
    TResult Function(Color color)? colorPicker,
    TResult Function(String value)? dropDown,
    required TResult orElse(),
  }) {
    if (dropDown != null) {
      return dropDown(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Increment value) increment,
    required TResult Function(_Decrement value) decrement,
    required TResult Function(_DatePicker value) datePicker,
    required TResult Function(_ColorPicker value) colorPicker,
    required TResult Function(_DropDown value) dropDown,
  }) {
    return dropDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Increment value)? increment,
    TResult? Function(_Decrement value)? decrement,
    TResult? Function(_DatePicker value)? datePicker,
    TResult? Function(_ColorPicker value)? colorPicker,
    TResult? Function(_DropDown value)? dropDown,
  }) {
    return dropDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Increment value)? increment,
    TResult Function(_Decrement value)? decrement,
    TResult Function(_DatePicker value)? datePicker,
    TResult Function(_ColorPicker value)? colorPicker,
    TResult Function(_DropDown value)? dropDown,
    required TResult orElse(),
  }) {
    if (dropDown != null) {
      return dropDown(this);
    }
    return orElse();
  }
}

abstract class _DropDown implements FormElementsEvent {
  const factory _DropDown(final String value) = _$DropDownImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownImplCopyWith<_$DropDownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormElementsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormElementsStateCopyWith<$Res> {
  factory $FormElementsStateCopyWith(
          FormElementsState value, $Res Function(FormElementsState) then) =
      _$FormElementsStateCopyWithImpl<$Res, FormElementsState>;
}

/// @nodoc
class _$FormElementsStateCopyWithImpl<$Res, $Val extends FormElementsState>
    implements $FormElementsStateCopyWith<$Res> {
  _$FormElementsStateCopyWithImpl(this._value, this._then);

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
    extends _$FormElementsStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FormElementsState.initial()';
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
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
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
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FormElementsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$IncrementSuccessImplCopyWith<$Res> {
  factory _$$IncrementSuccessImplCopyWith(_$IncrementSuccessImpl value,
          $Res Function(_$IncrementSuccessImpl) then) =
      __$$IncrementSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$IncrementSuccessImplCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$IncrementSuccessImpl>
    implements _$$IncrementSuccessImplCopyWith<$Res> {
  __$$IncrementSuccessImplCopyWithImpl(_$IncrementSuccessImpl _value,
      $Res Function(_$IncrementSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$IncrementSuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementSuccessImpl implements _IncrementSuccess {
  const _$IncrementSuccessImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FormElementsState.incrementSuccess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementSuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementSuccessImplCopyWith<_$IncrementSuccessImpl> get copyWith =>
      __$$IncrementSuccessImplCopyWithImpl<_$IncrementSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return incrementSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return incrementSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (incrementSuccess != null) {
      return incrementSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return incrementSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return incrementSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (incrementSuccess != null) {
      return incrementSuccess(this);
    }
    return orElse();
  }
}

abstract class _IncrementSuccess implements FormElementsState {
  const factory _IncrementSuccess(final int value) = _$IncrementSuccessImpl;

  int get value;
  @JsonKey(ignore: true)
  _$$IncrementSuccessImplCopyWith<_$IncrementSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementSuccessImplCopyWith<$Res> {
  factory _$$DecrementSuccessImplCopyWith(_$DecrementSuccessImpl value,
          $Res Function(_$DecrementSuccessImpl) then) =
      __$$DecrementSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$DecrementSuccessImplCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$DecrementSuccessImpl>
    implements _$$DecrementSuccessImplCopyWith<$Res> {
  __$$DecrementSuccessImplCopyWithImpl(_$DecrementSuccessImpl _value,
      $Res Function(_$DecrementSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DecrementSuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecrementSuccessImpl implements _DecrementSuccess {
  const _$DecrementSuccessImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FormElementsState.decrementSuccess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementSuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementSuccessImplCopyWith<_$DecrementSuccessImpl> get copyWith =>
      __$$DecrementSuccessImplCopyWithImpl<_$DecrementSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return decrementSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return decrementSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (decrementSuccess != null) {
      return decrementSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return decrementSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return decrementSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (decrementSuccess != null) {
      return decrementSuccess(this);
    }
    return orElse();
  }
}

abstract class _DecrementSuccess implements FormElementsState {
  const factory _DecrementSuccess(final int value) = _$DecrementSuccessImpl;

  int get value;
  @JsonKey(ignore: true)
  _$$DecrementSuccessImplCopyWith<_$DecrementSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatepickerSuccessImplCopyWith<$Res> {
  factory _$$DatepickerSuccessImplCopyWith(_$DatepickerSuccessImpl value,
          $Res Function(_$DatepickerSuccessImpl) then) =
      __$$DatepickerSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dateAndtime});
}

/// @nodoc
class __$$DatepickerSuccessImplCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$DatepickerSuccessImpl>
    implements _$$DatepickerSuccessImplCopyWith<$Res> {
  __$$DatepickerSuccessImplCopyWithImpl(_$DatepickerSuccessImpl _value,
      $Res Function(_$DatepickerSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateAndtime = null,
  }) {
    return _then(_$DatepickerSuccessImpl(
      null == dateAndtime
          ? _value.dateAndtime
          : dateAndtime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatepickerSuccessImpl implements _DatepickerSuccess {
  const _$DatepickerSuccessImpl(this.dateAndtime);

  @override
  final String dateAndtime;

  @override
  String toString() {
    return 'FormElementsState.datepickerSuccess(dateAndtime: $dateAndtime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatepickerSuccessImpl &&
            (identical(other.dateAndtime, dateAndtime) ||
                other.dateAndtime == dateAndtime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateAndtime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatepickerSuccessImplCopyWith<_$DatepickerSuccessImpl> get copyWith =>
      __$$DatepickerSuccessImplCopyWithImpl<_$DatepickerSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return datepickerSuccess(dateAndtime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return datepickerSuccess?.call(dateAndtime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (datepickerSuccess != null) {
      return datepickerSuccess(dateAndtime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return datepickerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return datepickerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (datepickerSuccess != null) {
      return datepickerSuccess(this);
    }
    return orElse();
  }
}

abstract class _DatepickerSuccess implements FormElementsState {
  const factory _DatepickerSuccess(final String dateAndtime) =
      _$DatepickerSuccessImpl;

  String get dateAndtime;
  @JsonKey(ignore: true)
  _$$DatepickerSuccessImplCopyWith<_$DatepickerSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ColorpickerSuccessImplCopyWith<$Res> {
  factory _$$ColorpickerSuccessImplCopyWith(_$ColorpickerSuccessImpl value,
          $Res Function(_$ColorpickerSuccessImpl) then) =
      __$$ColorpickerSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color color});
}

/// @nodoc
class __$$ColorpickerSuccessImplCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$ColorpickerSuccessImpl>
    implements _$$ColorpickerSuccessImplCopyWith<$Res> {
  __$$ColorpickerSuccessImplCopyWithImpl(_$ColorpickerSuccessImpl _value,
      $Res Function(_$ColorpickerSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$ColorpickerSuccessImpl(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColorpickerSuccessImpl implements _ColorpickerSuccess {
  const _$ColorpickerSuccessImpl(this.color);

  @override
  final Color color;

  @override
  String toString() {
    return 'FormElementsState.colorpickerSuccess(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorpickerSuccessImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorpickerSuccessImplCopyWith<_$ColorpickerSuccessImpl> get copyWith =>
      __$$ColorpickerSuccessImplCopyWithImpl<_$ColorpickerSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return colorpickerSuccess(color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return colorpickerSuccess?.call(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (colorpickerSuccess != null) {
      return colorpickerSuccess(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return colorpickerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return colorpickerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (colorpickerSuccess != null) {
      return colorpickerSuccess(this);
    }
    return orElse();
  }
}

abstract class _ColorpickerSuccess implements FormElementsState {
  const factory _ColorpickerSuccess(final Color color) =
      _$ColorpickerSuccessImpl;

  Color get color;
  @JsonKey(ignore: true)
  _$$ColorpickerSuccessImplCopyWith<_$ColorpickerSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DropDownSuccessImplCopyWith<$Res> {
  factory _$$DropDownSuccessImplCopyWith(_$DropDownSuccessImpl value,
          $Res Function(_$DropDownSuccessImpl) then) =
      __$$DropDownSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$DropDownSuccessImplCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$DropDownSuccessImpl>
    implements _$$DropDownSuccessImplCopyWith<$Res> {
  __$$DropDownSuccessImplCopyWithImpl(
      _$DropDownSuccessImpl _value, $Res Function(_$DropDownSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DropDownSuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DropDownSuccessImpl implements _DropDownSuccess {
  const _$DropDownSuccessImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FormElementsState.dropDownSuccess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DropDownSuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DropDownSuccessImplCopyWith<_$DropDownSuccessImpl> get copyWith =>
      __$$DropDownSuccessImplCopyWithImpl<_$DropDownSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int value) incrementSuccess,
    required TResult Function(int value) decrementSuccess,
    required TResult Function(String dateAndtime) datepickerSuccess,
    required TResult Function(Color color) colorpickerSuccess,
    required TResult Function(String value) dropDownSuccess,
  }) {
    return dropDownSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int value)? incrementSuccess,
    TResult? Function(int value)? decrementSuccess,
    TResult? Function(String dateAndtime)? datepickerSuccess,
    TResult? Function(Color color)? colorpickerSuccess,
    TResult? Function(String value)? dropDownSuccess,
  }) {
    return dropDownSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int value)? incrementSuccess,
    TResult Function(int value)? decrementSuccess,
    TResult Function(String dateAndtime)? datepickerSuccess,
    TResult Function(Color color)? colorpickerSuccess,
    TResult Function(String value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (dropDownSuccess != null) {
      return dropDownSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IncrementSuccess value) incrementSuccess,
    required TResult Function(_DecrementSuccess value) decrementSuccess,
    required TResult Function(_DatepickerSuccess value) datepickerSuccess,
    required TResult Function(_ColorpickerSuccess value) colorpickerSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
  }) {
    return dropDownSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IncrementSuccess value)? incrementSuccess,
    TResult? Function(_DecrementSuccess value)? decrementSuccess,
    TResult? Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult? Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
  }) {
    return dropDownSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IncrementSuccess value)? incrementSuccess,
    TResult Function(_DecrementSuccess value)? decrementSuccess,
    TResult Function(_DatepickerSuccess value)? datepickerSuccess,
    TResult Function(_ColorpickerSuccess value)? colorpickerSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    required TResult orElse(),
  }) {
    if (dropDownSuccess != null) {
      return dropDownSuccess(this);
    }
    return orElse();
  }
}

abstract class _DropDownSuccess implements FormElementsState {
  const factory _DropDownSuccess(final String value) = _$DropDownSuccessImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownSuccessImplCopyWith<_$DropDownSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
