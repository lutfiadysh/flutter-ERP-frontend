part of 'form_wizard_bloc.dart';

@freezed
class FormWizardState with _$FormWizardState {
  const factory FormWizardState.initial() = _Initial;
  const factory FormWizardState.nextSuccess(int index, int clickCount) =
      _NextSuccess;
  const factory FormWizardState.previousSuccess(int index) = _PreviousSuccess;
  const factory FormWizardState.finishSuccess(bool isFinish) = _FinishSuccess;
  const factory FormWizardState.stepperSuccess(int index) = _StepperSuccess;
  const factory FormWizardState.dropDownSuccess(String value) =
      _DropDownSuccess;
  const factory FormWizardState.checkSuccess(bool value) = _CheckSuccess;
}
