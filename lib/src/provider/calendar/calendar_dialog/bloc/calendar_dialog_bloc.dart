import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_dialog_event.dart';
part 'calendar_dialog_state.dart';
part 'calendar_dialog_bloc.freezed.dart';

class CalendarDialogBloc
    extends Bloc<CalendarDialogEvent, CalendarDialogState> {
  CalendarDialogBloc() : super(const _Initial()) {
    on<CalendarDialogEvent>((event, emit) {
      emit(const _Initial());
      emit(_Loaded(
          autovalidateMode: event.autovalidateMode,
          category: event.category,
          isValidate: event.isValidate));
    });
  }
}
