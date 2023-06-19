part of 'calendar_format_bloc.dart';

@freezed
class CalendarFormatEvent with _$CalendarFormatEvent {
  const factory CalendarFormatEvent.loading(
          {required CalendarFormat calendarFormat,
          required Map<DateTime, List<Map<String, dynamic>>> eventsList}) =
      _Loading;
}
