// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_repeater_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormRepeaterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormRepeaterEventCopyWith<$Res> {
  factory $FormRepeaterEventCopyWith(
          FormRepeaterEvent value, $Res Function(FormRepeaterEvent) then) =
      _$FormRepeaterEventCopyWithImpl<$Res, FormRepeaterEvent>;
}

/// @nodoc
class _$FormRepeaterEventCopyWithImpl<$Res, $Val extends FormRepeaterEvent>
    implements $FormRepeaterEventCopyWith<$Res> {
  _$FormRepeaterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fileName,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? nameController = null,
    Object? emailController = null,
    Object? subjectController = null,
    Object? messageController = null,
  }) {
    return _then(_$AddImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == subjectController
          ? _value.subjectController
          : subjectController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == messageController
          ? _value.messageController
          : messageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl(this.fileName, this.nameController, this.emailController,
      this.subjectController, this.messageController);

  @override
  final String fileName;
  @override
  final TextEditingController nameController;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController subjectController;
  @override
  final TextEditingController messageController;

  @override
  String toString() {
    return 'FormRepeaterEvent.add(fileName: $fileName, nameController: $nameController, emailController: $emailController, subjectController: $subjectController, messageController: $messageController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.nameController, nameController) ||
                other.nameController == nameController) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.subjectController, subjectController) ||
                other.subjectController == subjectController) &&
            (identical(other.messageController, messageController) ||
                other.messageController == messageController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, nameController,
      emailController, subjectController, messageController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return add(fileName, nameController, emailController, subjectController,
        messageController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return add?.call(fileName, nameController, emailController,
        subjectController, messageController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(fileName, nameController, emailController, subjectController,
          messageController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements FormRepeaterEvent {
  const factory _Add(
      final String fileName,
      final TextEditingController nameController,
      final TextEditingController emailController,
      final TextEditingController subjectController,
      final TextEditingController messageController) = _$AddImpl;

  String get fileName;
  TextEditingController get nameController;
  TextEditingController get emailController;
  TextEditingController get subjectController;
  TextEditingController get messageController;
  @JsonKey(ignore: true)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeleteImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterEvent.delete(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return delete(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return delete?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements FormRepeaterEvent {
  const factory _Delete(final int index) = _$DeleteImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddFileImplCopyWith<$Res> {
  factory _$$AddFileImplCopyWith(
          _$AddFileImpl value, $Res Function(_$AddFileImpl) then) =
      __$$AddFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, int index});
}

/// @nodoc
class __$$AddFileImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$AddFileImpl>
    implements _$$AddFileImplCopyWith<$Res> {
  __$$AddFileImplCopyWithImpl(
      _$AddFileImpl _value, $Res Function(_$AddFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? index = null,
  }) {
    return _then(_$AddFileImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddFileImpl implements _AddFile {
  const _$AddFileImpl(this.fileName, this.index);

  @override
  final String fileName;
  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterEvent.addFile(fileName: $fileName, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFileImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFileImplCopyWith<_$AddFileImpl> get copyWith =>
      __$$AddFileImplCopyWithImpl<_$AddFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return addFile(fileName, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return addFile?.call(fileName, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(fileName, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return addFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return addFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(this);
    }
    return orElse();
  }
}

abstract class _AddFile implements FormRepeaterEvent {
  const factory _AddFile(final String fileName, final int index) =
      _$AddFileImpl;

  String get fileName;
  int get index;
  @JsonKey(ignore: true)
  _$$AddFileImplCopyWith<_$AddFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPhoneImplCopyWith<$Res> {
  factory _$$AddPhoneImplCopyWith(
          _$AddPhoneImpl value, $Res Function(_$AddPhoneImpl) then) =
      __$$AddPhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController phoneController});
}

/// @nodoc
class __$$AddPhoneImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$AddPhoneImpl>
    implements _$$AddPhoneImplCopyWith<$Res> {
  __$$AddPhoneImplCopyWithImpl(
      _$AddPhoneImpl _value, $Res Function(_$AddPhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneController = null,
  }) {
    return _then(_$AddPhoneImpl(
      null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$AddPhoneImpl implements _AddPhone {
  const _$AddPhoneImpl(this.phoneController);

  @override
  final TextEditingController phoneController;

  @override
  String toString() {
    return 'FormRepeaterEvent.addPhone(phoneController: $phoneController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPhoneImpl &&
            (identical(other.phoneController, phoneController) ||
                other.phoneController == phoneController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPhoneImplCopyWith<_$AddPhoneImpl> get copyWith =>
      __$$AddPhoneImplCopyWithImpl<_$AddPhoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return addPhone(phoneController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return addPhone?.call(phoneController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (addPhone != null) {
      return addPhone(phoneController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return addPhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return addPhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (addPhone != null) {
      return addPhone(this);
    }
    return orElse();
  }
}

abstract class _AddPhone implements FormRepeaterEvent {
  const factory _AddPhone(final TextEditingController phoneController) =
      _$AddPhoneImpl;

  TextEditingController get phoneController;
  @JsonKey(ignore: true)
  _$$AddPhoneImplCopyWith<_$AddPhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePhoneImplCopyWith<$Res> {
  factory _$$DeletePhoneImplCopyWith(
          _$DeletePhoneImpl value, $Res Function(_$DeletePhoneImpl) then) =
      __$$DeletePhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeletePhoneImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$DeletePhoneImpl>
    implements _$$DeletePhoneImplCopyWith<$Res> {
  __$$DeletePhoneImplCopyWithImpl(
      _$DeletePhoneImpl _value, $Res Function(_$DeletePhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeletePhoneImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeletePhoneImpl implements _DeletePhone {
  const _$DeletePhoneImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterEvent.deletePhone(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePhoneImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePhoneImplCopyWith<_$DeletePhoneImpl> get copyWith =>
      __$$DeletePhoneImplCopyWithImpl<_$DeletePhoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return deletePhone(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return deletePhone?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (deletePhone != null) {
      return deletePhone(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return deletePhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return deletePhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (deletePhone != null) {
      return deletePhone(this);
    }
    return orElse();
  }
}

abstract class _DeletePhone implements FormRepeaterEvent {
  const factory _DeletePhone(final int index) = _$DeletePhoneImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeletePhoneImplCopyWith<_$DeletePhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadioSelectImplCopyWith<$Res> {
  factory _$$RadioSelectImplCopyWith(
          _$RadioSelectImpl value, $Res Function(_$RadioSelectImpl) then) =
      __$$RadioSelectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RadioSelectImplCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$RadioSelectImpl>
    implements _$$RadioSelectImplCopyWith<$Res> {
  __$$RadioSelectImplCopyWithImpl(
      _$RadioSelectImpl _value, $Res Function(_$RadioSelectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RadioSelectImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RadioSelectImpl implements _RadioSelect {
  const _$RadioSelectImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FormRepeaterEvent.radioSelect(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioSelectImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioSelectImplCopyWith<_$RadioSelectImpl> get copyWith =>
      __$$RadioSelectImplCopyWithImpl<_$RadioSelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        add,
    required TResult Function(int index) delete,
    required TResult Function(String fileName, int index) addFile,
    required TResult Function(TextEditingController phoneController) addPhone,
    required TResult Function(int index) deletePhone,
    required TResult Function(String value) radioSelect,
  }) {
    return radioSelect(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult? Function(int index)? delete,
    TResult? Function(String fileName, int index)? addFile,
    TResult? Function(TextEditingController phoneController)? addPhone,
    TResult? Function(int index)? deletePhone,
    TResult? Function(String value)? radioSelect,
  }) {
    return radioSelect?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        add,
    TResult Function(int index)? delete,
    TResult Function(String fileName, int index)? addFile,
    TResult Function(TextEditingController phoneController)? addPhone,
    TResult Function(int index)? deletePhone,
    TResult Function(String value)? radioSelect,
    required TResult orElse(),
  }) {
    if (radioSelect != null) {
      return radioSelect(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_AddPhone value) addPhone,
    required TResult Function(_DeletePhone value) deletePhone,
    required TResult Function(_RadioSelect value) radioSelect,
  }) {
    return radioSelect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_AddPhone value)? addPhone,
    TResult? Function(_DeletePhone value)? deletePhone,
    TResult? Function(_RadioSelect value)? radioSelect,
  }) {
    return radioSelect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddFile value)? addFile,
    TResult Function(_AddPhone value)? addPhone,
    TResult Function(_DeletePhone value)? deletePhone,
    TResult Function(_RadioSelect value)? radioSelect,
    required TResult orElse(),
  }) {
    if (radioSelect != null) {
      return radioSelect(this);
    }
    return orElse();
  }
}

abstract class _RadioSelect implements FormRepeaterEvent {
  const factory _RadioSelect(final String value) = _$RadioSelectImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$RadioSelectImplCopyWith<_$RadioSelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FormRepeaterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormRepeaterStateCopyWith<$Res> {
  factory $FormRepeaterStateCopyWith(
          FormRepeaterState value, $Res Function(FormRepeaterState) then) =
      _$FormRepeaterStateCopyWithImpl<$Res, FormRepeaterState>;
}

/// @nodoc
class _$FormRepeaterStateCopyWithImpl<$Res, $Val extends FormRepeaterState>
    implements $FormRepeaterStateCopyWith<$Res> {
  _$FormRepeaterStateCopyWithImpl(this._value, this._then);

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
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FormRepeaterState.initial()';
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
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
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
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FormRepeaterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddSuccessImplCopyWith<$Res> {
  factory _$$AddSuccessImplCopyWith(
          _$AddSuccessImpl value, $Res Function(_$AddSuccessImpl) then) =
      __$$AddSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fileName,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController});
}

/// @nodoc
class __$$AddSuccessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$AddSuccessImpl>
    implements _$$AddSuccessImplCopyWith<$Res> {
  __$$AddSuccessImplCopyWithImpl(
      _$AddSuccessImpl _value, $Res Function(_$AddSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? nameController = null,
    Object? emailController = null,
    Object? subjectController = null,
    Object? messageController = null,
  }) {
    return _then(_$AddSuccessImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == nameController
          ? _value.nameController
          : nameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == subjectController
          ? _value.subjectController
          : subjectController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      null == messageController
          ? _value.messageController
          : messageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$AddSuccessImpl implements _AddSuccess {
  const _$AddSuccessImpl(this.fileName, this.nameController,
      this.emailController, this.subjectController, this.messageController);

  @override
  final String fileName;
  @override
  final TextEditingController nameController;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController subjectController;
  @override
  final TextEditingController messageController;

  @override
  String toString() {
    return 'FormRepeaterState.addSuceess(fileName: $fileName, nameController: $nameController, emailController: $emailController, subjectController: $subjectController, messageController: $messageController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSuccessImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.nameController, nameController) ||
                other.nameController == nameController) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.subjectController, subjectController) ||
                other.subjectController == subjectController) &&
            (identical(other.messageController, messageController) ||
                other.messageController == messageController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, nameController,
      emailController, subjectController, messageController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      __$$AddSuccessImplCopyWithImpl<_$AddSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return addSuceess(fileName, nameController, emailController,
        subjectController, messageController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return addSuceess?.call(fileName, nameController, emailController,
        subjectController, messageController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addSuceess != null) {
      return addSuceess(fileName, nameController, emailController,
          subjectController, messageController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return addSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return addSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addSuceess != null) {
      return addSuceess(this);
    }
    return orElse();
  }
}

abstract class _AddSuccess implements FormRepeaterState {
  const factory _AddSuccess(
      final String fileName,
      final TextEditingController nameController,
      final TextEditingController emailController,
      final TextEditingController subjectController,
      final TextEditingController messageController) = _$AddSuccessImpl;

  String get fileName;
  TextEditingController get nameController;
  TextEditingController get emailController;
  TextEditingController get subjectController;
  TextEditingController get messageController;
  @JsonKey(ignore: true)
  _$$AddSuccessImplCopyWith<_$AddSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSuccessImplCopyWith<$Res> {
  factory _$$DeleteSuccessImplCopyWith(
          _$DeleteSuccessImpl value, $Res Function(_$DeleteSuccessImpl) then) =
      __$$DeleteSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeleteSuccessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$DeleteSuccessImpl>
    implements _$$DeleteSuccessImplCopyWith<$Res> {
  __$$DeleteSuccessImplCopyWithImpl(
      _$DeleteSuccessImpl _value, $Res Function(_$DeleteSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeleteSuccessImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteSuccessImpl implements _DeleteSuccess {
  const _$DeleteSuccessImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterState.deleteSuceess(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSuccessImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSuccessImplCopyWith<_$DeleteSuccessImpl> get copyWith =>
      __$$DeleteSuccessImplCopyWithImpl<_$DeleteSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return deleteSuceess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return deleteSuceess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (deleteSuceess != null) {
      return deleteSuceess(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return deleteSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return deleteSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (deleteSuceess != null) {
      return deleteSuceess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements FormRepeaterState {
  const factory _DeleteSuccess(final int index) = _$DeleteSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeleteSuccessImplCopyWith<_$DeleteSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddFileSuccessImplCopyWith<$Res> {
  factory _$$AddFileSuccessImplCopyWith(_$AddFileSuccessImpl value,
          $Res Function(_$AddFileSuccessImpl) then) =
      __$$AddFileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, int index});
}

/// @nodoc
class __$$AddFileSuccessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$AddFileSuccessImpl>
    implements _$$AddFileSuccessImplCopyWith<$Res> {
  __$$AddFileSuccessImplCopyWithImpl(
      _$AddFileSuccessImpl _value, $Res Function(_$AddFileSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? index = null,
  }) {
    return _then(_$AddFileSuccessImpl(
      null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddFileSuccessImpl implements _AddFileSuccess {
  const _$AddFileSuccessImpl(this.fileName, this.index);

  @override
  final String fileName;
  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterState.addFileSuceess(fileName: $fileName, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFileSuccessImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFileSuccessImplCopyWith<_$AddFileSuccessImpl> get copyWith =>
      __$$AddFileSuccessImplCopyWithImpl<_$AddFileSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return addFileSuceess(fileName, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return addFileSuceess?.call(fileName, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addFileSuceess != null) {
      return addFileSuceess(fileName, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return addFileSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return addFileSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addFileSuceess != null) {
      return addFileSuceess(this);
    }
    return orElse();
  }
}

abstract class _AddFileSuccess implements FormRepeaterState {
  const factory _AddFileSuccess(final String fileName, final int index) =
      _$AddFileSuccessImpl;

  String get fileName;
  int get index;
  @JsonKey(ignore: true)
  _$$AddFileSuccessImplCopyWith<_$AddFileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPhoneSuccessImplCopyWith<$Res> {
  factory _$$AddPhoneSuccessImplCopyWith(_$AddPhoneSuccessImpl value,
          $Res Function(_$AddPhoneSuccessImpl) then) =
      __$$AddPhoneSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController phoneController});
}

/// @nodoc
class __$$AddPhoneSuccessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$AddPhoneSuccessImpl>
    implements _$$AddPhoneSuccessImplCopyWith<$Res> {
  __$$AddPhoneSuccessImplCopyWithImpl(
      _$AddPhoneSuccessImpl _value, $Res Function(_$AddPhoneSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneController = null,
  }) {
    return _then(_$AddPhoneSuccessImpl(
      null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$AddPhoneSuccessImpl implements _AddPhoneSuccess {
  const _$AddPhoneSuccessImpl(this.phoneController);

  @override
  final TextEditingController phoneController;

  @override
  String toString() {
    return 'FormRepeaterState.addPhoneSuceess(phoneController: $phoneController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPhoneSuccessImpl &&
            (identical(other.phoneController, phoneController) ||
                other.phoneController == phoneController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPhoneSuccessImplCopyWith<_$AddPhoneSuccessImpl> get copyWith =>
      __$$AddPhoneSuccessImplCopyWithImpl<_$AddPhoneSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return addPhoneSuceess(phoneController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return addPhoneSuceess?.call(phoneController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addPhoneSuceess != null) {
      return addPhoneSuceess(phoneController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return addPhoneSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return addPhoneSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (addPhoneSuceess != null) {
      return addPhoneSuceess(this);
    }
    return orElse();
  }
}

abstract class _AddPhoneSuccess implements FormRepeaterState {
  const factory _AddPhoneSuccess(final TextEditingController phoneController) =
      _$AddPhoneSuccessImpl;

  TextEditingController get phoneController;
  @JsonKey(ignore: true)
  _$$AddPhoneSuccessImplCopyWith<_$AddPhoneSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePhoneSuccessImplCopyWith<$Res> {
  factory _$$DeletePhoneSuccessImplCopyWith(_$DeletePhoneSuccessImpl value,
          $Res Function(_$DeletePhoneSuccessImpl) then) =
      __$$DeletePhoneSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$DeletePhoneSuccessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$DeletePhoneSuccessImpl>
    implements _$$DeletePhoneSuccessImplCopyWith<$Res> {
  __$$DeletePhoneSuccessImplCopyWithImpl(_$DeletePhoneSuccessImpl _value,
      $Res Function(_$DeletePhoneSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$DeletePhoneSuccessImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeletePhoneSuccessImpl implements _DeletePhoneSuccess {
  const _$DeletePhoneSuccessImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'FormRepeaterState.deletePhoneSuceess(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePhoneSuccessImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePhoneSuccessImplCopyWith<_$DeletePhoneSuccessImpl> get copyWith =>
      __$$DeletePhoneSuccessImplCopyWithImpl<_$DeletePhoneSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return deletePhoneSuceess(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return deletePhoneSuceess?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (deletePhoneSuceess != null) {
      return deletePhoneSuceess(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return deletePhoneSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return deletePhoneSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (deletePhoneSuceess != null) {
      return deletePhoneSuceess(this);
    }
    return orElse();
  }
}

abstract class _DeletePhoneSuccess implements FormRepeaterState {
  const factory _DeletePhoneSuccess(final int index) = _$DeletePhoneSuccessImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$DeletePhoneSuccessImplCopyWith<_$DeletePhoneSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadioSelectSuceessImplCopyWith<$Res> {
  factory _$$RadioSelectSuceessImplCopyWith(_$RadioSelectSuceessImpl value,
          $Res Function(_$RadioSelectSuceessImpl) then) =
      __$$RadioSelectSuceessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RadioSelectSuceessImplCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$RadioSelectSuceessImpl>
    implements _$$RadioSelectSuceessImplCopyWith<$Res> {
  __$$RadioSelectSuceessImplCopyWithImpl(_$RadioSelectSuceessImpl _value,
      $Res Function(_$RadioSelectSuceessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RadioSelectSuceessImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RadioSelectSuceessImpl implements _RadioSelectSuceess {
  const _$RadioSelectSuceessImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'FormRepeaterState.radioSelectSuceess(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioSelectSuceessImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioSelectSuceessImplCopyWith<_$RadioSelectSuceessImpl> get copyWith =>
      __$$RadioSelectSuceessImplCopyWithImpl<_$RadioSelectSuceessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)
        addSuceess,
    required TResult Function(int index) deleteSuceess,
    required TResult Function(String fileName, int index) addFileSuceess,
    required TResult Function(TextEditingController phoneController)
        addPhoneSuceess,
    required TResult Function(int index) deletePhoneSuceess,
    required TResult Function(String value) radioSelectSuceess,
  }) {
    return radioSelectSuceess(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult? Function(int index)? deleteSuceess,
    TResult? Function(String fileName, int index)? addFileSuceess,
    TResult? Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult? Function(int index)? deletePhoneSuceess,
    TResult? Function(String value)? radioSelectSuceess,
  }) {
    return radioSelectSuceess?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String fileName,
            TextEditingController nameController,
            TextEditingController emailController,
            TextEditingController subjectController,
            TextEditingController messageController)?
        addSuceess,
    TResult Function(int index)? deleteSuceess,
    TResult Function(String fileName, int index)? addFileSuceess,
    TResult Function(TextEditingController phoneController)? addPhoneSuceess,
    TResult Function(int index)? deletePhoneSuceess,
    TResult Function(String value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (radioSelectSuceess != null) {
      return radioSelectSuceess(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddSuccess value) addSuceess,
    required TResult Function(_DeleteSuccess value) deleteSuceess,
    required TResult Function(_AddFileSuccess value) addFileSuceess,
    required TResult Function(_AddPhoneSuccess value) addPhoneSuceess,
    required TResult Function(_DeletePhoneSuccess value) deletePhoneSuceess,
    required TResult Function(_RadioSelectSuceess value) radioSelectSuceess,
  }) {
    return radioSelectSuceess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddSuccess value)? addSuceess,
    TResult? Function(_DeleteSuccess value)? deleteSuceess,
    TResult? Function(_AddFileSuccess value)? addFileSuceess,
    TResult? Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult? Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult? Function(_RadioSelectSuceess value)? radioSelectSuceess,
  }) {
    return radioSelectSuceess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddSuccess value)? addSuceess,
    TResult Function(_DeleteSuccess value)? deleteSuceess,
    TResult Function(_AddFileSuccess value)? addFileSuceess,
    TResult Function(_AddPhoneSuccess value)? addPhoneSuceess,
    TResult Function(_DeletePhoneSuccess value)? deletePhoneSuceess,
    TResult Function(_RadioSelectSuceess value)? radioSelectSuceess,
    required TResult orElse(),
  }) {
    if (radioSelectSuceess != null) {
      return radioSelectSuceess(this);
    }
    return orElse();
  }
}

abstract class _RadioSelectSuceess implements FormRepeaterState {
  const factory _RadioSelectSuceess(final String value) =
      _$RadioSelectSuceessImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$RadioSelectSuceessImplCopyWith<_$RadioSelectSuceessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
