// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_upload_file_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormUploadFileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> filesList) addFile,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> filesList)? addFile,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> filesList)? addFile,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddFile value)? addFile,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormUploadFileEventCopyWith<$Res> {
  factory $FormUploadFileEventCopyWith(
          FormUploadFileEvent value, $Res Function(FormUploadFileEvent) then) =
      _$FormUploadFileEventCopyWithImpl<$Res, FormUploadFileEvent>;
}

/// @nodoc
class _$FormUploadFileEventCopyWithImpl<$Res, $Val extends FormUploadFileEvent>
    implements $FormUploadFileEventCopyWith<$Res> {
  _$FormUploadFileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddFileImplCopyWith<$Res> {
  factory _$$AddFileImplCopyWith(
          _$AddFileImpl value, $Res Function(_$AddFileImpl) then) =
      __$$AddFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> filesList});
}

/// @nodoc
class __$$AddFileImplCopyWithImpl<$Res>
    extends _$FormUploadFileEventCopyWithImpl<$Res, _$AddFileImpl>
    implements _$$AddFileImplCopyWith<$Res> {
  __$$AddFileImplCopyWithImpl(
      _$AddFileImpl _value, $Res Function(_$AddFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filesList = null,
  }) {
    return _then(_$AddFileImpl(
      null == filesList
          ? _value._filesList
          : filesList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$AddFileImpl implements _AddFile {
  const _$AddFileImpl(final List<dynamic> filesList) : _filesList = filesList;

  final List<dynamic> _filesList;
  @override
  List<dynamic> get filesList {
    if (_filesList is EqualUnmodifiableListView) return _filesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesList);
  }

  @override
  String toString() {
    return 'FormUploadFileEvent.addFile(filesList: $filesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFileImpl &&
            const DeepCollectionEquality()
                .equals(other._filesList, _filesList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFileImplCopyWith<_$AddFileImpl> get copyWith =>
      __$$AddFileImplCopyWithImpl<_$AddFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> filesList) addFile,
    required TResult Function() clear,
  }) {
    return addFile(filesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> filesList)? addFile,
    TResult? Function()? clear,
  }) {
    return addFile?.call(filesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> filesList)? addFile,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(filesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_Clear value) clear,
  }) {
    return addFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_Clear value)? clear,
  }) {
    return addFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddFile value)? addFile,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (addFile != null) {
      return addFile(this);
    }
    return orElse();
  }
}

abstract class _AddFile implements FormUploadFileEvent {
  const factory _AddFile(final List<dynamic> filesList) = _$AddFileImpl;

  List<dynamic> get filesList;
  @JsonKey(ignore: true)
  _$$AddFileImplCopyWith<_$AddFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$FormUploadFileEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'FormUploadFileEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> filesList) addFile,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> filesList)? addFile,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> filesList)? addFile,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddFile value) addFile,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddFile value)? addFile,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddFile value)? addFile,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements FormUploadFileEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
mixin _$FormUploadFileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<dynamic> filesList) fileSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> filesList)? fileSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> filesList)? fileSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FileSuccess value) fileSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FileSuccess value)? fileSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FileSuccess value)? fileSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormUploadFileStateCopyWith<$Res> {
  factory $FormUploadFileStateCopyWith(
          FormUploadFileState value, $Res Function(FormUploadFileState) then) =
      _$FormUploadFileStateCopyWithImpl<$Res, FormUploadFileState>;
}

/// @nodoc
class _$FormUploadFileStateCopyWithImpl<$Res, $Val extends FormUploadFileState>
    implements $FormUploadFileStateCopyWith<$Res> {
  _$FormUploadFileStateCopyWithImpl(this._value, this._then);

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
    extends _$FormUploadFileStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FormUploadFileState.initial()';
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
    required TResult Function(List<dynamic> filesList) fileSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> filesList)? fileSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> filesList)? fileSuccess,
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
    required TResult Function(_FileSuccess value) fileSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FileSuccess value)? fileSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FileSuccess value)? fileSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FormUploadFileState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FileSuccessImplCopyWith<$Res> {
  factory _$$FileSuccessImplCopyWith(
          _$FileSuccessImpl value, $Res Function(_$FileSuccessImpl) then) =
      __$$FileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> filesList});
}

/// @nodoc
class __$$FileSuccessImplCopyWithImpl<$Res>
    extends _$FormUploadFileStateCopyWithImpl<$Res, _$FileSuccessImpl>
    implements _$$FileSuccessImplCopyWith<$Res> {
  __$$FileSuccessImplCopyWithImpl(
      _$FileSuccessImpl _value, $Res Function(_$FileSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filesList = null,
  }) {
    return _then(_$FileSuccessImpl(
      null == filesList
          ? _value._filesList
          : filesList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$FileSuccessImpl implements _FileSuccess {
  const _$FileSuccessImpl(final List<dynamic> filesList)
      : _filesList = filesList;

  final List<dynamic> _filesList;
  @override
  List<dynamic> get filesList {
    if (_filesList is EqualUnmodifiableListView) return _filesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesList);
  }

  @override
  String toString() {
    return 'FormUploadFileState.fileSuccess(filesList: $filesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._filesList, _filesList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileSuccessImplCopyWith<_$FileSuccessImpl> get copyWith =>
      __$$FileSuccessImplCopyWithImpl<_$FileSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<dynamic> filesList) fileSuccess,
  }) {
    return fileSuccess(filesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<dynamic> filesList)? fileSuccess,
  }) {
    return fileSuccess?.call(filesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<dynamic> filesList)? fileSuccess,
    required TResult orElse(),
  }) {
    if (fileSuccess != null) {
      return fileSuccess(filesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FileSuccess value) fileSuccess,
  }) {
    return fileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FileSuccess value)? fileSuccess,
  }) {
    return fileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FileSuccess value)? fileSuccess,
    required TResult orElse(),
  }) {
    if (fileSuccess != null) {
      return fileSuccess(this);
    }
    return orElse();
  }
}

abstract class _FileSuccess implements FormUploadFileState {
  const factory _FileSuccess(final List<dynamic> filesList) = _$FileSuccessImpl;

  List<dynamic> get filesList;
  @JsonKey(ignore: true)
  _$$FileSuccessImplCopyWith<_$FileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
