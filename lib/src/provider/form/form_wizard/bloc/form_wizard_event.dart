part of 'form_wizard_bloc.dart';

@freezed
class FormWizardEvent with _$FormWizardEvent {
  const factory FormWizardEvent.nextClick(int index, int clickCount) =
      _NextClick;
  const factory FormWizardEvent.previousClick(int index) = _PreviousClick;
  const factory FormWizardEvent.finishClick(bool isFinish) = _FinishClick;
  const factory FormWizardEvent.stepperClick(int index) = _StepperClick;
  const factory FormWizardEvent.dropDown(String value) = _DropDown;
  const factory FormWizardEvent.check(bool value) = _Check;
}
