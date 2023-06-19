part of 'calendar_format_bloc.dart';

@freezed
class CalendarFormatState with _$CalendarFormatState {
  const factory CalendarFormatState.initial() = _Initial;
  const factory CalendarFormatState.loaded(
      {required CalendarFormat calendarFormat,
      required Map<DateTime, List<Map<String, dynamic>>> eventsList}) = _Loaded;
}
