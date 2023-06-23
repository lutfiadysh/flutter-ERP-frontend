// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_wizard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormWizardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormWizardEventCopyWith<$Res> {
  factory $FormWizardEventCopyWith(
          FormWizardEvent value, $Res Function(FormWizardEvent) then) =
      _$FormWizardEventCopyWithImpl<$Res, FormWizardEvent>;
}

/// @nodoc
class _$FormWizardEventCopyWithImpl<$Res, $Val extends FormWizardEvent>
    implements $FormWizardEventCopyWith<$Res> {
  _$FormWizardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NextClickCopyWith<$Res> {
  factory _$$_NextClickCopyWith(
          _$_NextClick value, $Res Function(_$_NextClick) then) =
      __$$_NextClickCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int clickCount});
}

/// @nodoc
class __$$_NextClickCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$_NextClick>
    implements _$$_NextClickCopyWith<$Res> {
  __$$_NextClickCopyWithImpl(
      _$_NextClick _value, $Res Function(_$_NextClick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? clickCount = null,
  }) {
    return _then(_$_NextClick(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NextClick implements _NextClick {
  const _$_NextClick(this.index, this.clickCount);

  @override
  final int index;
  @override
  final int clickCount;

  @override
  String toString() {
    return 'FormWizardEvent.nextClick(index: $index, clickCount: $clickCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextClick &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, clickCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextClickCopyWith<_$_NextClick> get copyWith =>
      __$$_NextClickCopyWithImpl<_$_NextClick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return nextClick(index, clickCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return nextClick?.call(index, clickCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) {
    if (nextClick != null) {
      return nextClick(index, clickCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return nextClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return nextClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (nextClick != null) {
      return nextClick(this);
    }
    return orElse();
  }
}

abstract class _NextClick implements FormWizardEvent {
  const factory _NextClick(final int index, final int clickCount) =
      _$_NextClick;

  int get index;
  int get clickCount;
  @JsonKey(ignore: true)
  _$$_NextClickCopyWith<_$_NextClick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PreviousClickCopyWith<$Res> {
  factory _$$_PreviousClickCopyWith(
          _$_PreviousClick value, $Res Function(_$_PreviousClick) then) =
      __$$_PreviousClickCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_PreviousClickCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$_PreviousClick>
    implements _$$_PreviousClickCopyWith<$Res> {
  __$$_PreviousClickCopyWithImpl(
      _$_PreviousClick _value, $Res Function(_$_PreviousClick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_PreviousClick(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PreviousClick implements _PreviousClick {
  const _$_PreviousClick(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormWizardEvent.previousClick(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreviousClick &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreviousClickCopyWith<_$_PreviousClick> get copyWith =>
      __$$_PreviousClickCopyWithImpl<_$_PreviousClick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return previousClick(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return previousClick?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) {
    if (previousClick != null) {
      return previousClick(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return previousClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return previousClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (previousClick != null) {
      return previousClick(this);
    }
    return orElse();
  }
}

abstract class _PreviousClick implements FormWizardEvent {
  const factory _PreviousClick(final int index) = _$_PreviousClick;

  int get index;
  @JsonKey(ignore: true)
  _$$_PreviousClickCopyWith<_$_PreviousClick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FinishClickCopyWith<$Res> {
  factory _$$_FinishClickCopyWith(
          _$_FinishClick value, $Res Function(_$_FinishClick) then) =
      __$$_FinishClickCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFinish});
}

/// @nodoc
class __$$_FinishClickCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$_FinishClick>
    implements _$$_FinishClickCopyWith<$Res> {
  __$$_FinishClickCopyWithImpl(
      _$_FinishClick _value, $Res Function(_$_FinishClick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinish = null,
  }) {
    return _then(_$_FinishClick(
      null == isFinish
          ? _value.isFinish
          : isFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FinishClick implements _FinishClick {
  const _$_FinishClick(this.isFinish);

  @override
  final bool isFinish;

  @override
  String toString() {
    return 'FormWizardEvent.finishClick(isFinish: $isFinish)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FinishClick &&
            (identical(other.isFinish, isFinish) ||
                other.isFinish == isFinish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFinish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinishClickCopyWith<_$_FinishClick> get copyWith =>
      __$$_FinishClickCopyWithImpl<_$_FinishClick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return finishClick(isFinish);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return finishClick?.call(isFinish);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) {
    if (finishClick != null) {
      return finishClick(isFinish);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return finishClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return finishClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (finishClick != null) {
      return finishClick(this);
    }
    return orElse();
  }
}

abstract class _FinishClick implements FormWizardEvent {
  const factory _FinishClick(final bool isFinish) = _$_FinishClick;

  bool get isFinish;
  @JsonKey(ignore: true)
  _$$_FinishClickCopyWith<_$_FinishClick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StepperClickCopyWith<$Res> {
  factory _$$_StepperClickCopyWith(
          _$_StepperClick value, $Res Function(_$_StepperClick) then) =
      __$$_StepperClickCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_StepperClickCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$_StepperClick>
    implements _$$_StepperClickCopyWith<$Res> {
  __$$_StepperClickCopyWithImpl(
      _$_StepperClick _value, $Res Function(_$_StepperClick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_StepperClick(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StepperClick implements _StepperClick {
  const _$_StepperClick(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormWizardEvent.stepperClick(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepperClick &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepperClickCopyWith<_$_StepperClick> get copyWith =>
      __$$_StepperClickCopyWithImpl<_$_StepperClick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return stepperClick(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return stepperClick?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) {
    if (stepperClick != null) {
      return stepperClick(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return stepperClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return stepperClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (stepperClick != null) {
      return stepperClick(this);
    }
    return orElse();
  }
}

abstract class _StepperClick implements FormWizardEvent {
  const factory _StepperClick(final int index) = _$_StepperClick;

  int get index;
  @JsonKey(ignore: true)
  _$$_StepperClickCopyWith<_$_StepperClick> get copyWith =>
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
    extends _$FormWizardEventCopyWithImpl<$Res, _$_DropDown>
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
    return 'FormWizardEvent.dropDown(value: $value)';
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
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return dropDown(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return dropDown?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
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
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return dropDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return dropDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (dropDown != null) {
      return dropDown(this);
    }
    return orElse();
  }
}

abstract class _DropDown implements FormWizardEvent {
  const factory _DropDown(final String value) = _$_DropDown;

  String get value;
  @JsonKey(ignore: true)
  _$$_DropDownCopyWith<_$_DropDown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckCopyWith<$Res> {
  factory _$$_CheckCopyWith(_$_Check value, $Res Function(_$_Check) then) =
      __$$_CheckCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$_CheckCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$_Check>
    implements _$$_CheckCopyWith<$Res> {
  __$$_CheckCopyWithImpl(_$_Check _value, $Res Function(_$_Check) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_Check(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Check implements _Check {
  const _$_Check(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'FormWizardEvent.check(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Check &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckCopyWith<_$_Check> get copyWith =>
      __$$_CheckCopyWithImpl<_$_Check>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int clickCount) nextClick,
    required TResult Function(int index) previousClick,
    required TResult Function(bool isFinish) finishClick,
    required TResult Function(int index) stepperClick,
    required TResult Function(String value) dropDown,
    required TResult Function(bool value) check,
  }) {
    return check(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int clickCount)? nextClick,
    TResult? Function(int index)? previousClick,
    TResult? Function(bool isFinish)? finishClick,
    TResult? Function(int index)? stepperClick,
    TResult? Function(String value)? dropDown,
    TResult? Function(bool value)? check,
  }) {
    return check?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int clickCount)? nextClick,
    TResult Function(int index)? previousClick,
    TResult Function(bool isFinish)? finishClick,
    TResult Function(int index)? stepperClick,
    TResult Function(String value)? dropDown,
    TResult Function(bool value)? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextClick value) nextClick,
    required TResult Function(_PreviousClick value) previousClick,
    required TResult Function(_FinishClick value) finishClick,
    required TResult Function(_StepperClick value) stepperClick,
    required TResult Function(_DropDown value) dropDown,
    required TResult Function(_Check value) check,
  }) {
    return check(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NextClick value)? nextClick,
    TResult? Function(_PreviousClick value)? previousClick,
    TResult? Function(_FinishClick value)? finishClick,
    TResult? Function(_StepperClick value)? stepperClick,
    TResult? Function(_DropDown value)? dropDown,
    TResult? Function(_Check value)? check,
  }) {
    return check?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextClick value)? nextClick,
    TResult Function(_PreviousClick value)? previousClick,
    TResult Function(_FinishClick value)? finishClick,
    TResult Function(_StepperClick value)? stepperClick,
    TResult Function(_DropDown value)? dropDown,
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class _Check implements FormWizardEvent {
  const factory _Check(final bool value) = _$_Check;

  bool get value;
  @JsonKey(ignore: true)
  _$$_CheckCopyWith<_$_Check> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormWizardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormWizardStateCopyWith<$Res> {
  factory $FormWizardStateCopyWith(
          FormWizardState value, $Res Function(FormWizardState) then) =
      _$FormWizardStateCopyWithImpl<$Res, FormWizardState>;
}

/// @nodoc
class _$FormWizardStateCopyWithImpl<$Res, $Val extends FormWizardState>
    implements $FormWizardStateCopyWith<$Res> {
  _$FormWizardStateCopyWithImpl(this._value, this._then);

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
    extends _$FormWizardStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FormWizardState.initial()';
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
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
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
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FormWizardState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_NextSuccessCopyWith<$Res> {
  factory _$$_NextSuccessCopyWith(
          _$_NextSuccess value, $Res Function(_$_NextSuccess) then) =
      __$$_NextSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int clickCount});
}

/// @nodoc
class __$$_NextSuccessCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$_NextSuccess>
    implements _$$_NextSuccessCopyWith<$Res> {
  __$$_NextSuccessCopyWithImpl(
      _$_NextSuccess _value, $Res Function(_$_NextSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? clickCount = null,
  }) {
    return _then(_$_NextSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == clickCount
          ? _value.clickCount
          : clickCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NextSuccess implements _NextSuccess {
  const _$_NextSuccess(this.index, this.clickCount);

  @override
  final int index;
  @override
  final int clickCount;

  @override
  String toString() {
    return 'FormWizardState.nextSuccess(index: $index, clickCount: $clickCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextSuccess &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, clickCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextSuccessCopyWith<_$_NextSuccess> get copyWith =>
      __$$_NextSuccessCopyWithImpl<_$_NextSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return nextSuccess(index, clickCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return nextSuccess?.call(index, clickCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (nextSuccess != null) {
      return nextSuccess(index, clickCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return nextSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return nextSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (nextSuccess != null) {
      return nextSuccess(this);
    }
    return orElse();
  }
}

abstract class _NextSuccess implements FormWizardState {
  const factory _NextSuccess(final int index, final int clickCount) =
      _$_NextSuccess;

  int get index;
  int get clickCount;
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
    extends _$FormWizardStateCopyWithImpl<$Res, _$_PreviousSuccess>
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
    return 'FormWizardState.previousSuccess(index: $index)';
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
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return previousSuccess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return previousSuccess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
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
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return previousSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return previousSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (previousSuccess != null) {
      return previousSuccess(this);
    }
    return orElse();
  }
}

abstract class _PreviousSuccess implements FormWizardState {
  const factory _PreviousSuccess(final int index) = _$_PreviousSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_PreviousSuccessCopyWith<_$_PreviousSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FinishSuccessCopyWith<$Res> {
  factory _$$_FinishSuccessCopyWith(
          _$_FinishSuccess value, $Res Function(_$_FinishSuccess) then) =
      __$$_FinishSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFinish});
}

/// @nodoc
class __$$_FinishSuccessCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$_FinishSuccess>
    implements _$$_FinishSuccessCopyWith<$Res> {
  __$$_FinishSuccessCopyWithImpl(
      _$_FinishSuccess _value, $Res Function(_$_FinishSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinish = null,
  }) {
    return _then(_$_FinishSuccess(
      null == isFinish
          ? _value.isFinish
          : isFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FinishSuccess implements _FinishSuccess {
  const _$_FinishSuccess(this.isFinish);

  @override
  final bool isFinish;

  @override
  String toString() {
    return 'FormWizardState.finishSuccess(isFinish: $isFinish)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FinishSuccess &&
            (identical(other.isFinish, isFinish) ||
                other.isFinish == isFinish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFinish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinishSuccessCopyWith<_$_FinishSuccess> get copyWith =>
      __$$_FinishSuccessCopyWithImpl<_$_FinishSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return finishSuccess(isFinish);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return finishSuccess?.call(isFinish);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (finishSuccess != null) {
      return finishSuccess(isFinish);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return finishSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return finishSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (finishSuccess != null) {
      return finishSuccess(this);
    }
    return orElse();
  }
}

abstract class _FinishSuccess implements FormWizardState {
  const factory _FinishSuccess(final bool isFinish) = _$_FinishSuccess;

  bool get isFinish;
  @JsonKey(ignore: true)
  _$$_FinishSuccessCopyWith<_$_FinishSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StepperSuccessCopyWith<$Res> {
  factory _$$_StepperSuccessCopyWith(
          _$_StepperSuccess value, $Res Function(_$_StepperSuccess) then) =
      __$$_StepperSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_StepperSuccessCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$_StepperSuccess>
    implements _$$_StepperSuccessCopyWith<$Res> {
  __$$_StepperSuccessCopyWithImpl(
      _$_StepperSuccess _value, $Res Function(_$_StepperSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_StepperSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StepperSuccess implements _StepperSuccess {
  const _$_StepperSuccess(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormWizardState.stepperSuccess(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepperSuccess &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepperSuccessCopyWith<_$_StepperSuccess> get copyWith =>
      __$$_StepperSuccessCopyWithImpl<_$_StepperSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return stepperSuccess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return stepperSuccess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (stepperSuccess != null) {
      return stepperSuccess(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return stepperSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return stepperSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (stepperSuccess != null) {
      return stepperSuccess(this);
    }
    return orElse();
  }
}

abstract class _StepperSuccess implements FormWizardState {
  const factory _StepperSuccess(final int index) = _$_StepperSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_StepperSuccessCopyWith<_$_StepperSuccess> get copyWith =>
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
    extends _$FormWizardStateCopyWithImpl<$Res, _$_DropDownSuccess>
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
    return 'FormWizardState.dropDownSuccess(value: $value)';
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
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return dropDownSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return dropDownSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
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
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return dropDownSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return dropDownSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (dropDownSuccess != null) {
      return dropDownSuccess(this);
    }
    return orElse();
  }
}

abstract class _DropDownSuccess implements FormWizardState {
  const factory _DropDownSuccess(final String value) = _$_DropDownSuccess;

  String get value;
  @JsonKey(ignore: true)
  _$$_DropDownSuccessCopyWith<_$_DropDownSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckSuccessCopyWith<$Res> {
  factory _$$_CheckSuccessCopyWith(
          _$_CheckSuccess value, $Res Function(_$_CheckSuccess) then) =
      __$$_CheckSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$_CheckSuccessCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$_CheckSuccess>
    implements _$$_CheckSuccessCopyWith<$Res> {
  __$$_CheckSuccessCopyWithImpl(
      _$_CheckSuccess _value, $Res Function(_$_CheckSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_CheckSuccess(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CheckSuccess implements _CheckSuccess {
  const _$_CheckSuccess(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'FormWizardState.checkSuccess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckSuccess &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckSuccessCopyWith<_$_CheckSuccess> get copyWith =>
      __$$_CheckSuccessCopyWithImpl<_$_CheckSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index, int clickCount) nextSuccess,
    required TResult Function(int index) previousSuccess,
    required TResult Function(bool isFinish) finishSuccess,
    required TResult Function(int index) stepperSuccess,
    required TResult Function(String value) dropDownSuccess,
    required TResult Function(bool value) checkSuccess,
  }) {
    return checkSuccess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index, int clickCount)? nextSuccess,
    TResult? Function(int index)? previousSuccess,
    TResult? Function(bool isFinish)? finishSuccess,
    TResult? Function(int index)? stepperSuccess,
    TResult? Function(String value)? dropDownSuccess,
    TResult? Function(bool value)? checkSuccess,
  }) {
    return checkSuccess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index, int clickCount)? nextSuccess,
    TResult Function(int index)? previousSuccess,
    TResult Function(bool isFinish)? finishSuccess,
    TResult Function(int index)? stepperSuccess,
    TResult Function(String value)? dropDownSuccess,
    TResult Function(bool value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (checkSuccess != null) {
      return checkSuccess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NextSuccess value) nextSuccess,
    required TResult Function(_PreviousSuccess value) previousSuccess,
    required TResult Function(_FinishSuccess value) finishSuccess,
    required TResult Function(_StepperSuccess value) stepperSuccess,
    required TResult Function(_DropDownSuccess value) dropDownSuccess,
    required TResult Function(_CheckSuccess value) checkSuccess,
  }) {
    return checkSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NextSuccess value)? nextSuccess,
    TResult? Function(_PreviousSuccess value)? previousSuccess,
    TResult? Function(_FinishSuccess value)? finishSuccess,
    TResult? Function(_StepperSuccess value)? stepperSuccess,
    TResult? Function(_DropDownSuccess value)? dropDownSuccess,
    TResult? Function(_CheckSuccess value)? checkSuccess,
  }) {
    return checkSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NextSuccess value)? nextSuccess,
    TResult Function(_PreviousSuccess value)? previousSuccess,
    TResult Function(_FinishSuccess value)? finishSuccess,
    TResult Function(_StepperSuccess value)? stepperSuccess,
    TResult Function(_DropDownSuccess value)? dropDownSuccess,
    TResult Function(_CheckSuccess value)? checkSuccess,
    required TResult orElse(),
  }) {
    if (checkSuccess != null) {
      return checkSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckSuccess implements FormWizardState {
  const factory _CheckSuccess(final bool value) = _$_CheckSuccess;

  bool get value;
  @JsonKey(ignore: true)
  _$$_CheckSuccessCopyWith<_$_CheckSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
