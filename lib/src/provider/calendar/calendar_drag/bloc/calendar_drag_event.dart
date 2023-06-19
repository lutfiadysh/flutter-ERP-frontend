part of 'calendar_drag_bloc.dart';

@freezed
class CalendarDragEvent with _$CalendarDragEvent {
  const factory CalendarDragEvent.started({required bool dragStarted}) = _Started;
}