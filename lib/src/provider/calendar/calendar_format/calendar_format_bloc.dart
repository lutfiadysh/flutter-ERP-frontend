import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_format_event.dart';
part 'calendar_format_state.dart';
part 'calendar_format_bloc.freezed.dart';

class CalendarFormatBloc
    extends Bloc<CalendarFormatEvent, CalendarFormatState> {
  CalendarFormatBloc() : super(const _Initial()) {
    on<CalendarFormatEvent>((event, emit) {
      emit(const _Initial());
      emit(_Loaded(
          calendarFormat: event.calendarFormat, eventsList: event.eventsList));
    });
  }
}
