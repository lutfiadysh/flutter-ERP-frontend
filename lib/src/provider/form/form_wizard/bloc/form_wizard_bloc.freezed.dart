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
abstract class _$$NextClickImplCopyWith<$Res> {
  factory _$$NextClickImplCopyWith(
          _$NextClickImpl value, $Res Function(_$NextClickImpl) then) =
      __$$NextClickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int clickCount});
}

/// @nodoc
class __$$NextClickImplCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$NextClickImpl>
    implements _$$NextClickImplCopyWith<$Res> {
  __$$NextClickImplCopyWithImpl(
      _$NextClickImpl _value, $Res Function(_$NextClickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? clickCount = null,
  }) {
    return _then(_$NextClickImpl(
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

class _$NextClickImpl implements _NextClick {
  const _$NextClickImpl(this.index, this.clickCount);

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
            other is _$NextClickImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, clickCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextClickImplCopyWith<_$NextClickImpl> get copyWith =>
      __$$NextClickImplCopyWithImpl<_$NextClickImpl>(this, _$identity);

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
      _$NextClickImpl;

  int get index;
  int get clickCount;
  @JsonKey(ignore: true)
  _$$NextClickImplCopyWith<_$NextClickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousClickImplCopyWith<$Res> {
  factory _$$PreviousClickImplCopyWith(
          _$PreviousClickImpl value, $Res Function(_$PreviousClickImpl) then) =
      __$$PreviousClickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PreviousClickImplCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$PreviousClickImpl>
    implements _$$PreviousClickImplCopyWith<$Res> {
  __$$PreviousClickImplCopyWithImpl(
      _$PreviousClickImpl _value, $Res Function(_$PreviousClickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PreviousClickImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PreviousClickImpl implements _PreviousClick {
  const _$PreviousClickImpl(this.index);

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
            other is _$PreviousClickImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviousClickImplCopyWith<_$PreviousClickImpl> get copyWith =>
      __$$PreviousClickImplCopyWithImpl<_$PreviousClickImpl>(this, _$identity);

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
  const factory _PreviousClick(final int index) = _$PreviousClickImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$PreviousClickImplCopyWith<_$PreviousClickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishClickImplCopyWith<$Res> {
  factory _$$FinishClickImplCopyWith(
          _$FinishClickImpl value, $Res Function(_$FinishClickImpl) then) =
      __$$FinishClickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFinish});
}

/// @nodoc
class __$$FinishClickImplCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$FinishClickImpl>
    implements _$$FinishClickImplCopyWith<$Res> {
  __$$FinishClickImplCopyWithImpl(
      _$FinishClickImpl _value, $Res Function(_$FinishClickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinish = null,
  }) {
    return _then(_$FinishClickImpl(
      null == isFinish
          ? _value.isFinish
          : isFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FinishClickImpl implements _FinishClick {
  const _$FinishClickImpl(this.isFinish);

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
            other is _$FinishClickImpl &&
            (identical(other.isFinish, isFinish) ||
                other.isFinish == isFinish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFinish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishClickImplCopyWith<_$FinishClickImpl> get copyWith =>
      __$$FinishClickImplCopyWithImpl<_$FinishClickImpl>(this, _$identity);

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
  const factory _FinishClick(final bool isFinish) = _$FinishClickImpl;

  bool get isFinish;
  @JsonKey(ignore: true)
  _$$FinishClickImplCopyWith<_$FinishClickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepperClickImplCopyWith<$Res> {
  factory _$$StepperClickImplCopyWith(
          _$StepperClickImpl value, $Res Function(_$StepperClickImpl) then) =
      __$$StepperClickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$StepperClickImplCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$StepperClickImpl>
    implements _$$StepperClickImplCopyWith<$Res> {
  __$$StepperClickImplCopyWithImpl(
      _$StepperClickImpl _value, $Res Function(_$StepperClickImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$StepperClickImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StepperClickImpl implements _StepperClick {
  const _$StepperClickImpl(this.index);

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
            other is _$StepperClickImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperClickImplCopyWith<_$StepperClickImpl> get copyWith =>
      __$$StepperClickImplCopyWithImpl<_$StepperClickImpl>(this, _$identity);

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
  const factory _StepperClick(final int index) = _$StepperClickImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$StepperClickImplCopyWith<_$StepperClickImpl> get copyWith =>
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
    extends _$FormWizardEventCopyWithImpl<$Res, _$DropDownImpl>
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
    return 'FormWizardEvent.dropDown(value: $value)';
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
  const factory _DropDown(final String value) = _$DropDownImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownImplCopyWith<_$DropDownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckImplCopyWith<$Res> {
  factory _$$CheckImplCopyWith(
          _$CheckImpl value, $Res Function(_$CheckImpl) then) =
      __$$CheckImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$CheckImplCopyWithImpl<$Res>
    extends _$FormWizardEventCopyWithImpl<$Res, _$CheckImpl>
    implements _$$CheckImplCopyWith<$Res> {
  __$$CheckImplCopyWithImpl(
      _$CheckImpl _value, $Res Function(_$CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CheckImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckImpl implements _Check {
  const _$CheckImpl(this.value);

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
            other is _$CheckImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckImplCopyWith<_$CheckImpl> get copyWith =>
      __$$CheckImplCopyWithImpl<_$CheckImpl>(this, _$identity);

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
  const factory _Check(final bool value) = _$CheckImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$CheckImplCopyWith<_$CheckImpl> get copyWith =>
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
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FormWizardState.initial()';
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
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NextSuccessImplCopyWith<$Res> {
  factory _$$NextSuccessImplCopyWith(
          _$NextSuccessImpl value, $Res Function(_$NextSuccessImpl) then) =
      __$$NextSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int clickCount});
}

/// @nodoc
class __$$NextSuccessImplCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$NextSuccessImpl>
    implements _$$NextSuccessImplCopyWith<$Res> {
  __$$NextSuccessImplCopyWithImpl(
      _$NextSuccessImpl _value, $Res Function(_$NextSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? clickCount = null,
  }) {
    return _then(_$NextSuccessImpl(
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

class _$NextSuccessImpl implements _NextSuccess {
  const _$NextSuccessImpl(this.index, this.clickCount);

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
            other is _$NextSuccessImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.clickCount, clickCount) ||
                other.clickCount == clickCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, clickCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextSuccessImplCopyWith<_$NextSuccessImpl> get copyWith =>
      __$$NextSuccessImplCopyWithImpl<_$NextSuccessImpl>(this, _$identity);

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
      _$NextSuccessImpl;

  int get index;
  int get clickCount;
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
    extends _$FormWizardStateCopyWithImpl<$Res, _$PreviousSuccessImpl>
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
    return 'FormWizardState.previousSuccess(index: $index)';
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
  const factory _PreviousSuccess(final int index) = _$PreviousSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$PreviousSuccessImplCopyWith<_$PreviousSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishSuccessImplCopyWith<$Res> {
  factory _$$FinishSuccessImplCopyWith(
          _$FinishSuccessImpl value, $Res Function(_$FinishSuccessImpl) then) =
      __$$FinishSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFinish});
}

/// @nodoc
class __$$FinishSuccessImplCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$FinishSuccessImpl>
    implements _$$FinishSuccessImplCopyWith<$Res> {
  __$$FinishSuccessImplCopyWithImpl(
      _$FinishSuccessImpl _value, $Res Function(_$FinishSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFinish = null,
  }) {
    return _then(_$FinishSuccessImpl(
      null == isFinish
          ? _value.isFinish
          : isFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FinishSuccessImpl implements _FinishSuccess {
  const _$FinishSuccessImpl(this.isFinish);

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
            other is _$FinishSuccessImpl &&
            (identical(other.isFinish, isFinish) ||
                other.isFinish == isFinish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFinish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishSuccessImplCopyWith<_$FinishSuccessImpl> get copyWith =>
      __$$FinishSuccessImplCopyWithImpl<_$FinishSuccessImpl>(this, _$identity);

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
  const factory _FinishSuccess(final bool isFinish) = _$FinishSuccessImpl;

  bool get isFinish;
  @JsonKey(ignore: true)
  _$$FinishSuccessImplCopyWith<_$FinishSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepperSuccessImplCopyWith<$Res> {
  factory _$$StepperSuccessImplCopyWith(_$StepperSuccessImpl value,
          $Res Function(_$StepperSuccessImpl) then) =
      __$$StepperSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$StepperSuccessImplCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$StepperSuccessImpl>
    implements _$$StepperSuccessImplCopyWith<$Res> {
  __$$StepperSuccessImplCopyWithImpl(
      _$StepperSuccessImpl _value, $Res Function(_$StepperSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$StepperSuccessImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StepperSuccessImpl implements _StepperSuccess {
  const _$StepperSuccessImpl(this.index);

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
            other is _$StepperSuccessImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperSuccessImplCopyWith<_$StepperSuccessImpl> get copyWith =>
      __$$StepperSuccessImplCopyWithImpl<_$StepperSuccessImpl>(
          this, _$identity);

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
  const factory _StepperSuccess(final int index) = _$StepperSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$StepperSuccessImplCopyWith<_$StepperSuccessImpl> get copyWith =>
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
    extends _$FormWizardStateCopyWithImpl<$Res, _$DropDownSuccessImpl>
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
    return 'FormWizardState.dropDownSuccess(value: $value)';
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
  const factory _DropDownSuccess(final String value) = _$DropDownSuccessImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$DropDownSuccessImplCopyWith<_$DropDownSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckSuccessImplCopyWith<$Res> {
  factory _$$CheckSuccessImplCopyWith(
          _$CheckSuccessImpl value, $Res Function(_$CheckSuccessImpl) then) =
      __$$CheckSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$CheckSuccessImplCopyWithImpl<$Res>
    extends _$FormWizardStateCopyWithImpl<$Res, _$CheckSuccessImpl>
    implements _$$CheckSuccessImplCopyWith<$Res> {
  __$$CheckSuccessImplCopyWithImpl(
      _$CheckSuccessImpl _value, $Res Function(_$CheckSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$CheckSuccessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CheckSuccessImpl implements _CheckSuccess {
  const _$CheckSuccessImpl(this.value);

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
            other is _$CheckSuccessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckSuccessImplCopyWith<_$CheckSuccessImpl> get copyWith =>
      __$$CheckSuccessImplCopyWithImpl<_$CheckSuccessImpl>(this, _$identity);

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
  const factory _CheckSuccess(final bool value) = _$CheckSuccessImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$CheckSuccessImplCopyWith<_$CheckSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
