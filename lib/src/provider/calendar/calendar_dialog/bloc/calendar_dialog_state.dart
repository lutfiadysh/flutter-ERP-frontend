part of 'calendar_dialog_bloc.dart';

@freezed
class CalendarDialogState with _$CalendarDialogState {
  const factory CalendarDialogState.initial() = _Initial;
  factory CalendarDialogState.loaded(
      {required AutovalidateMode autovalidateMode,
      required String category,
      required bool isValidate}) = _Loaded;
}
