part of 'form_upload_file_bloc.dart';

@freezed
class FormUploadFileState with _$FormUploadFileState {
  const factory FormUploadFileState.initial() = _Initial;
  const factory FormUploadFileState.fileSuccess(List<dynamic> filesList) =
      _FileSuccess;
}
