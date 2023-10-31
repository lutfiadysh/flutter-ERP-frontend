// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_validation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormValidationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) checkBox,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? checkBox,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? checkBox,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormValidationEventCopyWith<$Res> {
  factory $FormValidationEventCopyWith(
          FormValidationEvent value, $Res Function(FormValidationEvent) then) =
      _$FormValidationEventCopyWithImpl<$Res, FormValidationEvent>;
}

/// @nodoc
class _$FormValidationEventCopyWithImpl<$Res, $Val extends FormValidationEvent>
    implements $FormValidationEventCopyWith<$Res> {
  _$FormValidationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$FormValidationEventCopyWithImpl<$Res, _$DropDownImpl>
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
    return 'FormValidationEvent.dropDown(value: $value)';
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
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) checkBox,
    required TResult Function() submit,
  }) {
    return dropDown(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? checkBox,
    TResult? Function()? submit,
  }) {
    return dropDown?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? checkBox,
    TResult Function()? submit,
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
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_Submit value) submit,
  }) {
    return dropDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_Submit value)? submit,
  }) {
    return dropDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (dropDown != null) {
      return dropDown(this);
    }
    return orElse();
  }
}

abstract class _DropDown implements FormValidationEvent {
  const factory _DropDown(final String value) = _$DropDownImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownImplCopyWith<_$DropDownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckBoxImplCopyWith<$Res> {
  factory _$$CheckBoxImplCopyWith(
          _$CheckBoxImpl value, $Res Function(_$CheckBoxImpl) then) =
      __$$CheckBoxImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$CheckBoxImplCopyWithImpl<$Res>
    extends _$FormValidationEventCopyWithImpl<$Res, _$CheckBoxImpl>
    implements _$$CheckBoxImplCopyWith<$Res> {
  __$$CheckBoxImplCopyWithImpl(
      _$CheckBoxImpl _value, $Res Function(_$CheckBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CheckBoxImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckBoxImpl implements _CheckBox {
  const _$CheckBoxImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'FormValidationEvent.checkBox(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckBoxImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckBoxImplCopyWith<_$CheckBoxImpl> get copyWith =>
      __$$CheckBoxImplCopyWithImpl<_$CheckBoxImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) checkBox,
    required TResult Function() submit,
  }) {
    return checkBox(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? checkBox,
    TResult? Function()? submit,
  }) {
    return checkBox?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? checkBox,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_Submit value) submit,
  }) {
    return checkBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_Submit value)? submit,
  }) {
    return checkBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(this);
    }
    return orElse();
  }
}

abstract class _CheckBox implements FormValidationEvent {
  const factory _CheckBox(final bool value) = _$CheckBoxImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$CheckBoxImplCopyWith<_$CheckBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$FormValidationEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'FormValidationEvent.submit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) checkBox,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? checkBox,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? checkBox,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_CheckBox value) checkBox,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_CheckBox value)? checkBox,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_CheckBox value)? checkBox,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements FormValidationEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
mixin _$FormValidationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) dropeDownSuccess,
    required TResult Function(bool value) checkBoxSuccess,
    required TResult Function() formSubmitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? dropeDownSuccess,
    TResult? Function(bool value)? checkBoxSuccess,
    TResult? Function()? formSubmitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? dropeDownSuccess,
    TResult Function(bool value)? checkBoxSuccess,
    TResult Function()? formSubmitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DropDownSuccess value) dropeDownSuccess,
    required TResult Function(_CheckBoxSuccess value) checkBoxSuccess,
    required TResult Function(_FormSubmitSuccess value) formSubmitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult? Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult? Function(_FormSubmitSuccess value)? formSubmitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult Function(_FormSubmitSuccess value)? formSubmitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormValidationStateCopyWith<$Res> {
  factory $FormValidationStateCopyWith(
          FormValidationState value, $Res Function(FormValidationState) then) =
      _$FormValidationStateCopyWithImpl<$Res, FormValidationState>;
}

/// @nodoc
class _$FormValidationStateCopyWithImpl<$Res, $Val extends FormValidationState>
    implements $FormValidationStateCopyWith<$Res> {
  _$FormValidationStateCopyWithImpl(this._value, this._then);

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
    extends _$FormValidationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FormValidationState.initial()';
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
    required TResult Function(String value) dropeDownSuccess,
    required TResult Function(bool value) checkBoxSuccess,
    required TResult Function() formSubmitSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? dropeDownSuccess,
    TResult? Function(bool value)? checkBoxSuccess,
    TResult? Function()? formSubmitSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? dropeDownSuccess,
    TResult Function(bool value)? checkBoxSuccess,
    TResult Function()? formSubmitSuccess,
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
    required TResult Function(_DropDownSuccess value) dropeDownSuccess,
    required TResult Function(_CheckBoxSuccess value) checkBoxSuccess,
    required TResult Function(_FormSubmitSuccess value) formSubmitSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult? Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult? Function(_FormSubmitSuccess value)? formSubmitSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult Function(_FormSubmitSuccess value)? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FormValidationState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$FormValidationStateCopyWithImpl<$Res, _$DropDownSuccessImpl>
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
    return 'FormValidationState.dropeDownSuccess(value: $value)';
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
    required TResult Function(String value) dropeDownSuccess,
    required TResult Function(bool value) checkBoxSuccess,
    required TResult Function() formSubmitSuccess,
  }) {
    return dropeDownSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? dropeDownSuccess,
    TResult? Function(bool value)? checkBoxSuccess,
    TResult? Function()? formSubmitSuccess,
  }) {
    return dropeDownSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? dropeDownSuccess,
    TResult Function(bool value)? checkBoxSuccess,
    TResult Function()? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (dropeDownSuccess != null) {
      return dropeDownSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DropDownSuccess value) dropeDownSuccess,
    required TResult Function(_CheckBoxSuccess value) checkBoxSuccess,
    required TResult Function(_FormSubmitSuccess value) formSubmitSuccess,
  }) {
    return dropeDownSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult? Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult? Function(_FormSubmitSuccess value)? formSubmitSuccess,
  }) {
    return dropeDownSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult Function(_FormSubmitSuccess value)? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (dropeDownSuccess != null) {
      return dropeDownSuccess(this);
    }
    return orElse();
  }
}

abstract class _DropDownSuccess implements FormValidationState {
  const factory _DropDownSuccess(final String value) = _$DropDownSuccessImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownSuccessImplCopyWith<_$DropDownSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckBoxSuccessImplCopyWith<$Res> {
  factory _$$CheckBoxSuccessImplCopyWith(_$CheckBoxSuccessImpl value,
          $Res Function(_$CheckBoxSuccessImpl) then) =
      __$$CheckBoxSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$CheckBoxSuccessImplCopyWithImpl<$Res>
    extends _$FormValidationStateCopyWithImpl<$Res, _$CheckBoxSuccessImpl>
    implements _$$CheckBoxSuccessImplCopyWith<$Res> {
  __$$CheckBoxSuccessImplCopyWithImpl(
      _$CheckBoxSuccessImpl _value, $Res Function(_$CheckBoxSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CheckBoxSuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckBoxSuccessImpl implements _CheckBoxSuccess {
  const _$CheckBoxSuccessImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'FormValidationState.checkBoxSuccess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckBoxSuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckBoxSuccessImplCopyWith<_$CheckBoxSuccessImpl> get copyWith =>
      __$$CheckBoxSuccessImplCopyWithImpl<_$CheckBoxSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) dropeDownSuccess,
    required TResult Function(bool value) checkBoxSuccess,
    required TResult Function() formSubmitSuccess,
  }) {
    return checkBoxSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? dropeDownSuccess,
    TResult? Function(bool value)? checkBoxSuccess,
    TResult? Function()? formSubmitSuccess,
  }) {
    return checkBoxSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? dropeDownSuccess,
    TResult Function(bool value)? checkBoxSuccess,
    TResult Function()? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (checkBoxSuccess != null) {
      return checkBoxSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DropDownSuccess value) dropeDownSuccess,
    required TResult Function(_CheckBoxSuccess value) checkBoxSuccess,
    required TResult Function(_FormSubmitSuccess value) formSubmitSuccess,
  }) {
    return checkBoxSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult? Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult? Function(_FormSubmitSuccess value)? formSubmitSuccess,
  }) {
    return checkBoxSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult Function(_FormSubmitSuccess value)? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (checkBoxSuccess != null) {
      return checkBoxSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckBoxSuccess implements FormValidationState {
  const factory _CheckBoxSuccess(final bool value) = _$CheckBoxSuccessImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$CheckBoxSuccessImplCopyWith<_$CheckBoxSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormSubmitSuccessImplCopyWith<$Res> {
  factory _$$FormSubmitSuccessImplCopyWith(_$FormSubmitSuccessImpl value,
          $Res Function(_$FormSubmitSuccessImpl) then) =
      __$$FormSubmitSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FormSubmitSuccessImplCopyWithImpl<$Res>
    extends _$FormValidationStateCopyWithImpl<$Res, _$FormSubmitSuccessImpl>
    implements _$$FormSubmitSuccessImplCopyWith<$Res> {
  __$$FormSubmitSuccessImplCopyWithImpl(_$FormSubmitSuccessImpl _value,
      $Res Function(_$FormSubmitSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FormSubmitSuccessImpl implements _FormSubmitSuccess {
  const _$FormSubmitSuccessImpl();

  @override
  String toString() {
    return 'FormValidationState.formSubmitSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FormSubmitSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) dropeDownSuccess,
    required TResult Function(bool value) checkBoxSuccess,
    required TResult Function() formSubmitSuccess,
  }) {
    return formSubmitSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? dropeDownSuccess,
    TResult? Function(bool value)? checkBoxSuccess,
    TResult? Function()? formSubmitSuccess,
  }) {
    return formSubmitSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? dropeDownSuccess,
    TResult Function(bool value)? checkBoxSuccess,
    TResult Function()? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (formSubmitSuccess != null) {
      return formSubmitSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DropDownSuccess value) dropeDownSuccess,
    required TResult Function(_CheckBoxSuccess value) checkBoxSuccess,
    required TResult Function(_FormSubmitSuccess value) formSubmitSuccess,
  }) {
    return formSubmitSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult? Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult? Function(_FormSubmitSuccess value)? formSubmitSuccess,
  }) {
    return formSubmitSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DropDownSuccess value)? dropeDownSuccess,
    TResult Function(_CheckBoxSuccess value)? checkBoxSuccess,
    TResult Function(_FormSubmitSuccess value)? formSubmitSuccess,
    required TResult orElse(),
  }) {
    if (formSubmitSuccess != null) {
      return formSubmitSuccess(this);
    }
    return orElse();
  }
}

abstract class _FormSubmitSuccess implements FormValidationState {
  const factory _FormSubmitSuccess() = _$FormSubmitSuccessImpl;
}
