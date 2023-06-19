import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_wizard_event.dart';
part 'form_wizard_state.dart';
part 'form_wizard_bloc.freezed.dart';

class FormWizardBloc extends Bloc<FormWizardEvent, FormWizardState> {
  FormWizardBloc() : super(const _Initial()) {
    on<FormWizardEvent>((event, emit) {
      if (event is _NextClick) {
        // emit(const _Initial());
        emit(FormWizardState.nextSuccess(event.index, event.clickCount));
      } else if (event is _PreviousClick) {
        emit(FormWizardState.previousSuccess(event.index));
      } else if (event is _FinishClick) {
        emit(FormWizardState.finishSuccess(event.isFinish));
      } else if (event is _StepperClick) {
        emit(FormWizardState.stepperSuccess(event.index));
      } else if (event is _DropDown) {
        emit(FormWizardState.dropDownSuccess(event.value));
      } else if (event is _Check) {
        emit(FormWizardState.checkSuccess(event.value));
      }
    });
  }
}
