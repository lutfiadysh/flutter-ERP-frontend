part of 'checkbox_bloc.dart';

@freezed
class CheckboxEvent with _$CheckboxEvent {
  const factory CheckboxEvent.started({required bool isChecked}) =
      _Started;
}
