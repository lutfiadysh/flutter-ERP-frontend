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
abstract class _$$_IncrementCopyWith<$Res> {
  factory _$$_IncrementCopyWith(
          _$_Increment value, $Res Function(_$_Increment) then) =
      __$$_IncrementCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_IncrementCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$_Increment>
    implements _$$_IncrementCopyWith<$Res> {
  __$$_IncrementCopyWithImpl(
      _$_Increment _value, $Res Function(_$_Increment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_Increment(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Increment implements _Increment {
  const _$_Increment(this.value);

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
            other is _$_Increment &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncrementCopyWith<_$_Increment> get copyWith =>
      __$$_IncrementCopyWithImpl<_$_Increment>(this, _$identity);

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
  const factory _Increment(final int value) = _$_Increment;

  int get value;
  @JsonKey(ignore: true)
  _$$_IncrementCopyWith<_$_Increment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DecrementCopyWith<$Res> {
  factory _$$_DecrementCopyWith(
          _$_Decrement value, $Res Function(_$_Decrement) then) =
      __$$_DecrementCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_DecrementCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$_Decrement>
    implements _$$_DecrementCopyWith<$Res> {
  __$$_DecrementCopyWithImpl(
      _$_Decrement _value, $Res Function(_$_Decrement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_Decrement(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Decrement implements _Decrement {
  const _$_Decrement(this.value);

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
            other is _$_Decrement &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecrementCopyWith<_$_Decrement> get copyWith =>
      __$$_DecrementCopyWithImpl<_$_Decrement>(this, _$identity);

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
  const factory _Decrement(final int value) = _$_Decrement;

  int get value;
  @JsonKey(ignore: true)
  _$$_DecrementCopyWith<_$_Decrement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DatePickerCopyWith<$Res> {
  factory _$$_DatePickerCopyWith(
          _$_DatePicker value, $Res Function(_$_DatePicker) then) =
      __$$_DatePickerCopyWithImpl<$Res>;
  @useResult
  $Res call({String dateAndtime});
}

/// @nodoc
class __$$_DatePickerCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$_DatePicker>
    implements _$$_DatePickerCopyWith<$Res> {
  __$$_DatePickerCopyWithImpl(
      _$_DatePicker _value, $Res Function(_$_DatePicker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateAndtime = null,
  }) {
    return _then(_$_DatePicker(
      null == dateAndtime
          ? _value.dateAndtime
          : dateAndtime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DatePicker implements _DatePicker {
  const _$_DatePicker(this.dateAndtime);

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
            other is _$_DatePicker &&
            (identical(other.dateAndtime, dateAndtime) ||
                other.dateAndtime == dateAndtime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateAndtime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatePickerCopyWith<_$_DatePicker> get copyWith =>
      __$$_DatePickerCopyWithImpl<_$_DatePicker>(this, _$identity);

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
  const factory _DatePicker(final String dateAndtime) = _$_DatePicker;

  String get dateAndtime;
  @JsonKey(ignore: true)
  _$$_DatePickerCopyWith<_$_DatePicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ColorPickerCopyWith<$Res> {
  factory _$$_ColorPickerCopyWith(
          _$_ColorPicker value, $Res Function(_$_ColorPicker) then) =
      __$$_ColorPickerCopyWithImpl<$Res>;
  @useResult
  $Res call({Color color});
}

/// @nodoc
class __$$_ColorPickerCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$_ColorPicker>
    implements _$$_ColorPickerCopyWith<$Res> {
  __$$_ColorPickerCopyWithImpl(
      _$_ColorPicker _value, $Res Function(_$_ColorPicker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$_ColorPicker(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ColorPicker implements _ColorPicker {
  const _$_ColorPicker(this.color);

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
            other is _$_ColorPicker &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorPickerCopyWith<_$_ColorPicker> get copyWith =>
      __$$_ColorPickerCopyWithImpl<_$_ColorPicker>(this, _$identity);

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
  const factory _ColorPicker(final Color color) = _$_ColorPicker;

  Color get color;
  @JsonKey(ignore: true)
  _$$_ColorPickerCopyWith<_$_ColorPicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DropDownCopyWith<$Res> {
  factory _$$_DropDownCopyWith(
          _$_DropDown value, $Res Function(_$_DropDown) then) =
      __$$_DropDownCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_DropDownCopyWithImpl<$Res>
    extends _$FormElementsEventCopyWithImpl<$Res, _$_DropDown>
    implements _$$_DropDownCopyWith<$Res> {
  __$$_DropDownCopyWithImpl(
      _$_DropDown _value, $Res Function(_$_DropDown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_DropDown(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DropDown implements _DropDown {
  const _$_DropDown(this.value);

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
            other is _$_DropDown &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DropDownCopyWith<_$_DropDown> get copyWith =>
      __$$_DropDownCopyWithImpl<_$_DropDown>(this, _$identity);

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
  const factory _DropDown(final String value) = _$_DropDown;

  String get value;
  @JsonKey(ignore: true)
  _$$_DropDownCopyWith<_$_DropDown> get copyWith =>
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FormElementsState.initial()';
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_IncrementSuccessCopyWith<$Res> {
  factory _$$_IncrementSuccessCopyWith(
          _$_IncrementSuccess value, $Res Function(_$_IncrementSuccess) then) =
      __$$_IncrementSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_IncrementSuccessCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_IncrementSuccess>
    implements _$$_IncrementSuccessCopyWith<$Res> {
  __$$_IncrementSuccessCopyWithImpl(
      _$_IncrementSuccess _value, $Res Function(_$_IncrementSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_IncrementSuccess(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IncrementSuccess implements _IncrementSuccess {
  const _$_IncrementSuccess(this.value);

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
            other is _$_IncrementSuccess &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncrementSuccessCopyWith<_$_IncrementSuccess> get copyWith =>
      __$$_IncrementSuccessCopyWithImpl<_$_IncrementSuccess>(this, _$identity);

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
  const factory _IncrementSuccess(final int value) = _$_IncrementSuccess;

  int get value;
  @JsonKey(ignore: true)
  _$$_IncrementSuccessCopyWith<_$_IncrementSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DecrementSuccessCopyWith<$Res> {
  factory _$$_DecrementSuccessCopyWith(
          _$_DecrementSuccess value, $Res Function(_$_DecrementSuccess) then) =
      __$$_DecrementSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_DecrementSuccessCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_DecrementSuccess>
    implements _$$_DecrementSuccessCopyWith<$Res> {
  __$$_DecrementSuccessCopyWithImpl(
      _$_DecrementSuccess _value, $Res Function(_$_DecrementSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_DecrementSuccess(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DecrementSuccess implements _DecrementSuccess {
  const _$_DecrementSuccess(this.value);

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
            other is _$_DecrementSuccess &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecrementSuccessCopyWith<_$_DecrementSuccess> get copyWith =>
      __$$_DecrementSuccessCopyWithImpl<_$_DecrementSuccess>(this, _$identity);

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
  const factory _DecrementSuccess(final int value) = _$_DecrementSuccess;

  int get value;
  @JsonKey(ignore: true)
  _$$_DecrementSuccessCopyWith<_$_DecrementSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DatepickerSuccessCopyWith<$Res> {
  factory _$$_DatepickerSuccessCopyWith(_$_DatepickerSuccess value,
          $Res Function(_$_DatepickerSuccess) then) =
      __$$_DatepickerSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String dateAndtime});
}

/// @nodoc
class __$$_DatepickerSuccessCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_DatepickerSuccess>
    implements _$$_DatepickerSuccessCopyWith<$Res> {
  __$$_DatepickerSuccessCopyWithImpl(
      _$_DatepickerSuccess _value, $Res Function(_$_DatepickerSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateAndtime = null,
  }) {
    return _then(_$_DatepickerSuccess(
      null == dateAndtime
          ? _value.dateAndtime
          : dateAndtime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DatepickerSuccess implements _DatepickerSuccess {
  const _$_DatepickerSuccess(this.dateAndtime);

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
            other is _$_DatepickerSuccess &&
            (identical(other.dateAndtime, dateAndtime) ||
                other.dateAndtime == dateAndtime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateAndtime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatepickerSuccessCopyWith<_$_DatepickerSuccess> get copyWith =>
      __$$_DatepickerSuccessCopyWithImpl<_$_DatepickerSuccess>(
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
      _$_DatepickerSuccess;

  String get dateAndtime;
  @JsonKey(ignore: true)
  _$$_DatepickerSuccessCopyWith<_$_DatepickerSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ColorpickerSuccessCopyWith<$Res> {
  factory _$$_ColorpickerSuccessCopyWith(_$_ColorpickerSuccess value,
          $Res Function(_$_ColorpickerSuccess) then) =
      __$$_ColorpickerSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({Color color});
}

/// @nodoc
class __$$_ColorpickerSuccessCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_ColorpickerSuccess>
    implements _$$_ColorpickerSuccessCopyWith<$Res> {
  __$$_ColorpickerSuccessCopyWithImpl(
      _$_ColorpickerSuccess _value, $Res Function(_$_ColorpickerSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
  }) {
    return _then(_$_ColorpickerSuccess(
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_ColorpickerSuccess implements _ColorpickerSuccess {
  const _$_ColorpickerSuccess(this.color);

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
            other is _$_ColorpickerSuccess &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorpickerSuccessCopyWith<_$_ColorpickerSuccess> get copyWith =>
      __$$_ColorpickerSuccessCopyWithImpl<_$_ColorpickerSuccess>(
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
  const factory _ColorpickerSuccess(final Color color) = _$_ColorpickerSuccess;

  Color get color;
  @JsonKey(ignore: true)
  _$$_ColorpickerSuccessCopyWith<_$_ColorpickerSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DropDownSuccessCopyWith<$Res> {
  factory _$$_DropDownSuccessCopyWith(
          _$_DropDownSuccess value, $Res Function(_$_DropDownSuccess) then) =
      __$$_DropDownSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_DropDownSuccessCopyWithImpl<$Res>
    extends _$FormElementsStateCopyWithImpl<$Res, _$_DropDownSuccess>
    implements _$$_DropDownSuccessCopyWith<$Res> {
  __$$_DropDownSuccessCopyWithImpl(
      _$_DropDownSuccess _value, $Res Function(_$_DropDownSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_DropDownSuccess(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DropDownSuccess implements _DropDownSuccess {
  const _$_DropDownSuccess(this.value);

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
            other is _$_DropDownSuccess &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DropDownSuccessCopyWith<_$_DropDownSuccess> get copyWith =>
      __$$_DropDownSuccessCopyWithImpl<_$_DropDownSuccess>(this, _$identity);

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
  const factory _DropDownSuccess(final String value) = _$_DropDownSuccess;

  String get value;
  @JsonKey(ignore: true)
  _$$_DropDownSuccessCopyWith<_$_DropDownSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
