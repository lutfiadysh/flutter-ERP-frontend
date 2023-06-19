import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_upload_file_event.dart';
part 'form_upload_file_state.dart';
part 'form_upload_file_bloc.freezed.dart';

class FormUploadFileBloc
    extends Bloc<FormUploadFileEvent, FormUploadFileState> {
  FormUploadFileBloc() : super(const _Initial()) {
    on<FormUploadFileEvent>((event, emit) {
      if (event is _AddFile) {
        emit(const FormUploadFileState.initial());
        emit(FormUploadFileState.fileSuccess(event.filesList));
      } else if (event is _Clear) {
        emit(const FormUploadFileState.initial());
      }
    });
  }
}
