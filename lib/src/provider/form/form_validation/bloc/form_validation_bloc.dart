import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';
part 'form_validation_bloc.freezed.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(const _Initial()) {
    on<FormValidationEvent>((event, emit) {
      if (event is _DropDown) {
        emit(FormValidationState.dropeDownSuccess(event.value));
      } else if (event is _CheckBox) {
        emit(FormValidationState.checkBoxSuccess(event.value));
      } else if (event is _Submit) {
        emit(const FormValidationState.formSubmitSuccess());
      }
    });
  }
}
