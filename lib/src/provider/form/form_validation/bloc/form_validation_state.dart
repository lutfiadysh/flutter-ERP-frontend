part of 'form_validation_bloc.dart';

@freezed
class FormValidationState with _$FormValidationState {
  const factory FormValidationState.initial() = _Initial;
  const factory FormValidationState.dropeDownSuccess(String value) =
      _DropDownSuccess;
  const factory FormValidationState.checkBoxSuccess(bool value) =
      _CheckBoxSuccess;
  const factory FormValidationState.formSubmitSuccess() = _FormSubmitSuccess;
}
