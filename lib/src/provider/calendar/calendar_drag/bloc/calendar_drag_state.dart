part of 'calendar_drag_bloc.dart';

@freezed
class CalendarDragState with _$CalendarDragState {
  const factory CalendarDragState.initial() = _Initial;
  const factory CalendarDragState.dragStart({required bool dragStarted}) =
      _DragStart;
}
