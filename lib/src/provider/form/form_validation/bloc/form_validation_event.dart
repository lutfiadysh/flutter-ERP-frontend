part of 'form_validation_bloc.dart';

@freezed
class FormValidationEvent with _$FormValidationEvent {
  const factory FormValidationEvent.dropDown(String value) = _DropDown;
  const factory FormValidationEvent.checkBox(bool value) = _CheckBox;
  const factory FormValidationEvent.submit() = _Submit;
}
