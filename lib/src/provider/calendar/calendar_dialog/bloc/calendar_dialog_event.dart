part of 'calendar_dialog_bloc.dart';

@freezed
class CalendarDialogEvent with _$CalendarDialogEvent {
  const factory CalendarDialogEvent.loading(
      {required AutovalidateMode autovalidateMode,
      required String category,
      required bool isValidate}) = _Started;
}
