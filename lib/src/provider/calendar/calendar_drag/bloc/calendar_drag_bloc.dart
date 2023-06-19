import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_drag_event.dart';
part 'calendar_drag_state.dart';
part 'calendar_drag_bloc.freezed.dart';

class CalendarDragBloc extends Bloc<CalendarDragEvent, CalendarDragState> {
  CalendarDragBloc() : super(const _Initial()) {
    on<CalendarDragEvent>((event, emit) {
      emit(const _Initial());
      emit(_DragStart(dragStarted: event.dragStarted));
    });
  }
}
