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
abstract class _$$_AddCopyWith<$Res> {
  factory _$$_AddCopyWith(_$_Add value, $Res Function(_$_Add) then) =
      __$$_AddCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fileName,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController});
}

/// @nodoc
class __$$_AddCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_Add>
    implements _$$_AddCopyWith<$Res> {
  __$$_AddCopyWithImpl(_$_Add _value, $Res Function(_$_Add) _then)
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
    return _then(_$_Add(
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

class _$_Add implements _Add {
  const _$_Add(this.fileName, this.nameController, this.emailController,
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
            other is _$_Add &&
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
  _$$_AddCopyWith<_$_Add> get copyWith =>
      __$$_AddCopyWithImpl<_$_Add>(this, _$identity);

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
      final TextEditingController messageController) = _$_Add;

  String get fileName;
  TextEditingController get nameController;
  TextEditingController get emailController;
  TextEditingController get subjectController;
  TextEditingController get messageController;
  @JsonKey(ignore: true)
  _$$_AddCopyWith<_$_Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_Delete>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_Delete(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete(this.index);

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
            other is _$_Delete &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

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
  const factory _Delete(final int index) = _$_Delete;

  int get index;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddFileCopyWith<$Res> {
  factory _$$_AddFileCopyWith(
          _$_AddFile value, $Res Function(_$_AddFile) then) =
      __$$_AddFileCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, int index});
}

/// @nodoc
class __$$_AddFileCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_AddFile>
    implements _$$_AddFileCopyWith<$Res> {
  __$$_AddFileCopyWithImpl(_$_AddFile _value, $Res Function(_$_AddFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? index = null,
  }) {
    return _then(_$_AddFile(
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

class _$_AddFile implements _AddFile {
  const _$_AddFile(this.fileName, this.index);

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
            other is _$_AddFile &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFileCopyWith<_$_AddFile> get copyWith =>
      __$$_AddFileCopyWithImpl<_$_AddFile>(this, _$identity);

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
  const factory _AddFile(final String fileName, final int index) = _$_AddFile;

  String get fileName;
  int get index;
  @JsonKey(ignore: true)
  _$$_AddFileCopyWith<_$_AddFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddPhoneCopyWith<$Res> {
  factory _$$_AddPhoneCopyWith(
          _$_AddPhone value, $Res Function(_$_AddPhone) then) =
      __$$_AddPhoneCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController phoneController});
}

/// @nodoc
class __$$_AddPhoneCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_AddPhone>
    implements _$$_AddPhoneCopyWith<$Res> {
  __$$_AddPhoneCopyWithImpl(
      _$_AddPhone _value, $Res Function(_$_AddPhone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneController = null,
  }) {
    return _then(_$_AddPhone(
      null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_AddPhone implements _AddPhone {
  const _$_AddPhone(this.phoneController);

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
            other is _$_AddPhone &&
            (identical(other.phoneController, phoneController) ||
                other.phoneController == phoneController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPhoneCopyWith<_$_AddPhone> get copyWith =>
      __$$_AddPhoneCopyWithImpl<_$_AddPhone>(this, _$identity);

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
      _$_AddPhone;

  TextEditingController get phoneController;
  @JsonKey(ignore: true)
  _$$_AddPhoneCopyWith<_$_AddPhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeletePhoneCopyWith<$Res> {
  factory _$$_DeletePhoneCopyWith(
          _$_DeletePhone value, $Res Function(_$_DeletePhone) then) =
      __$$_DeletePhoneCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_DeletePhoneCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_DeletePhone>
    implements _$$_DeletePhoneCopyWith<$Res> {
  __$$_DeletePhoneCopyWithImpl(
      _$_DeletePhone _value, $Res Function(_$_DeletePhone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_DeletePhone(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeletePhone implements _DeletePhone {
  const _$_DeletePhone(this.index);

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
            other is _$_DeletePhone &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletePhoneCopyWith<_$_DeletePhone> get copyWith =>
      __$$_DeletePhoneCopyWithImpl<_$_DeletePhone>(this, _$identity);

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
  const factory _DeletePhone(final int index) = _$_DeletePhone;

  int get index;
  @JsonKey(ignore: true)
  _$$_DeletePhoneCopyWith<_$_DeletePhone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RadioSelectCopyWith<$Res> {
  factory _$$_RadioSelectCopyWith(
          _$_RadioSelect value, $Res Function(_$_RadioSelect) then) =
      __$$_RadioSelectCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_RadioSelectCopyWithImpl<$Res>
    extends _$FormRepeaterEventCopyWithImpl<$Res, _$_RadioSelect>
    implements _$$_RadioSelectCopyWith<$Res> {
  __$$_RadioSelectCopyWithImpl(
      _$_RadioSelect _value, $Res Function(_$_RadioSelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_RadioSelect(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RadioSelect implements _RadioSelect {
  const _$_RadioSelect(this.value);

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
            other is _$_RadioSelect &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RadioSelectCopyWith<_$_RadioSelect> get copyWith =>
      __$$_RadioSelectCopyWithImpl<_$_RadioSelect>(this, _$identity);

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
  const factory _RadioSelect(final String value) = _$_RadioSelect;

  String get value;
  @JsonKey(ignore: true)
  _$$_RadioSelectCopyWith<_$_RadioSelect> get copyWith =>
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'FormRepeaterState.initial()';
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AddSuccessCopyWith<$Res> {
  factory _$$_AddSuccessCopyWith(
          _$_AddSuccess value, $Res Function(_$_AddSuccess) then) =
      __$$_AddSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fileName,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController});
}

/// @nodoc
class __$$_AddSuccessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_AddSuccess>
    implements _$$_AddSuccessCopyWith<$Res> {
  __$$_AddSuccessCopyWithImpl(
      _$_AddSuccess _value, $Res Function(_$_AddSuccess) _then)
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
    return _then(_$_AddSuccess(
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

class _$_AddSuccess implements _AddSuccess {
  const _$_AddSuccess(this.fileName, this.nameController, this.emailController,
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
    return 'FormRepeaterState.addSuceess(fileName: $fileName, nameController: $nameController, emailController: $emailController, subjectController: $subjectController, messageController: $messageController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSuccess &&
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
  _$$_AddSuccessCopyWith<_$_AddSuccess> get copyWith =>
      __$$_AddSuccessCopyWithImpl<_$_AddSuccess>(this, _$identity);

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
      final TextEditingController messageController) = _$_AddSuccess;

  String get fileName;
  TextEditingController get nameController;
  TextEditingController get emailController;
  TextEditingController get subjectController;
  TextEditingController get messageController;
  @JsonKey(ignore: true)
  _$$_AddSuccessCopyWith<_$_AddSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteSuccessCopyWith<$Res> {
  factory _$$_DeleteSuccessCopyWith(
          _$_DeleteSuccess value, $Res Function(_$_DeleteSuccess) then) =
      __$$_DeleteSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_DeleteSuccessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_DeleteSuccess>
    implements _$$_DeleteSuccessCopyWith<$Res> {
  __$$_DeleteSuccessCopyWithImpl(
      _$_DeleteSuccess _value, $Res Function(_$_DeleteSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_DeleteSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeleteSuccess implements _DeleteSuccess {
  const _$_DeleteSuccess(this.index);

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
            other is _$_DeleteSuccess &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteSuccessCopyWith<_$_DeleteSuccess> get copyWith =>
      __$$_DeleteSuccessCopyWithImpl<_$_DeleteSuccess>(this, _$identity);

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
  const factory _DeleteSuccess(final int index) = _$_DeleteSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_DeleteSuccessCopyWith<_$_DeleteSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddFileSuccessCopyWith<$Res> {
  factory _$$_AddFileSuccessCopyWith(
          _$_AddFileSuccess value, $Res Function(_$_AddFileSuccess) then) =
      __$$_AddFileSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileName, int index});
}

/// @nodoc
class __$$_AddFileSuccessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_AddFileSuccess>
    implements _$$_AddFileSuccessCopyWith<$Res> {
  __$$_AddFileSuccessCopyWithImpl(
      _$_AddFileSuccess _value, $Res Function(_$_AddFileSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? index = null,
  }) {
    return _then(_$_AddFileSuccess(
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

class _$_AddFileSuccess implements _AddFileSuccess {
  const _$_AddFileSuccess(this.fileName, this.index);

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
            other is _$_AddFileSuccess &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileName, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFileSuccessCopyWith<_$_AddFileSuccess> get copyWith =>
      __$$_AddFileSuccessCopyWithImpl<_$_AddFileSuccess>(this, _$identity);

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
      _$_AddFileSuccess;

  String get fileName;
  int get index;
  @JsonKey(ignore: true)
  _$$_AddFileSuccessCopyWith<_$_AddFileSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddPhoneSuccessCopyWith<$Res> {
  factory _$$_AddPhoneSuccessCopyWith(
          _$_AddPhoneSuccess value, $Res Function(_$_AddPhoneSuccess) then) =
      __$$_AddPhoneSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController phoneController});
}

/// @nodoc
class __$$_AddPhoneSuccessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_AddPhoneSuccess>
    implements _$$_AddPhoneSuccessCopyWith<$Res> {
  __$$_AddPhoneSuccessCopyWithImpl(
      _$_AddPhoneSuccess _value, $Res Function(_$_AddPhoneSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneController = null,
  }) {
    return _then(_$_AddPhoneSuccess(
      null == phoneController
          ? _value.phoneController
          : phoneController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_AddPhoneSuccess implements _AddPhoneSuccess {
  const _$_AddPhoneSuccess(this.phoneController);

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
            other is _$_AddPhoneSuccess &&
            (identical(other.phoneController, phoneController) ||
                other.phoneController == phoneController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPhoneSuccessCopyWith<_$_AddPhoneSuccess> get copyWith =>
      __$$_AddPhoneSuccessCopyWithImpl<_$_AddPhoneSuccess>(this, _$identity);

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
      _$_AddPhoneSuccess;

  TextEditingController get phoneController;
  @JsonKey(ignore: true)
  _$$_AddPhoneSuccessCopyWith<_$_AddPhoneSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeletePhoneSuccessCopyWith<$Res> {
  factory _$$_DeletePhoneSuccessCopyWith(_$_DeletePhoneSuccess value,
          $Res Function(_$_DeletePhoneSuccess) then) =
      __$$_DeletePhoneSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_DeletePhoneSuccessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_DeletePhoneSuccess>
    implements _$$_DeletePhoneSuccessCopyWith<$Res> {
  __$$_DeletePhoneSuccessCopyWithImpl(
      _$_DeletePhoneSuccess _value, $Res Function(_$_DeletePhoneSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_DeletePhoneSuccess(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeletePhoneSuccess implements _DeletePhoneSuccess {
  const _$_DeletePhoneSuccess(this.index);

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
            other is _$_DeletePhoneSuccess &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletePhoneSuccessCopyWith<_$_DeletePhoneSuccess> get copyWith =>
      __$$_DeletePhoneSuccessCopyWithImpl<_$_DeletePhoneSuccess>(
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
  const factory _DeletePhoneSuccess(final int index) = _$_DeletePhoneSuccess;

  int get index;
  @JsonKey(ignore: true)
  _$$_DeletePhoneSuccessCopyWith<_$_DeletePhoneSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RadioSelectSuceessCopyWith<$Res> {
  factory _$$_RadioSelectSuceessCopyWith(_$_RadioSelectSuceess value,
          $Res Function(_$_RadioSelectSuceess) then) =
      __$$_RadioSelectSuceessCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_RadioSelectSuceessCopyWithImpl<$Res>
    extends _$FormRepeaterStateCopyWithImpl<$Res, _$_RadioSelectSuceess>
    implements _$$_RadioSelectSuceessCopyWith<$Res> {
  __$$_RadioSelectSuceessCopyWithImpl(
      _$_RadioSelectSuceess _value, $Res Function(_$_RadioSelectSuceess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_RadioSelectSuceess(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RadioSelectSuceess implements _RadioSelectSuceess {
  const _$_RadioSelectSuceess(this.value);

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
            other is _$_RadioSelectSuceess &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RadioSelectSuceessCopyWith<_$_RadioSelectSuceess> get copyWith =>
      __$$_RadioSelectSuceessCopyWithImpl<_$_RadioSelectSuceess>(
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
  const factory _RadioSelectSuceess(final String value) = _$_RadioSelectSuceess;

  String get value;
  @JsonKey(ignore: true)
  _$$_RadioSelectSuceessCopyWith<_$_RadioSelectSuceess> get copyWith =>
      throw _privateConstructorUsedError;
}
