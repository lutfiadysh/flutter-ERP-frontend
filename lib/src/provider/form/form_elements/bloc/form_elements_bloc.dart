import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_elements_event.dart';
part 'form_elements_state.dart';
part 'form_elements_bloc.freezed.dart';

class FormElementsBloc extends Bloc<FormElementsEvent, FormElementsState> {
  FormElementsBloc() : super(const _Initial()) {
    on<FormElementsEvent>((event, emit) {
      if (event is _Increment) {
        emit(_IncrementSuccess(event.value + 1));
      } else if (event is _Decrement) {
        emit(_DecrementSuccess(event.value - 1));
      } else if (event is _DatePicker) {
        emit(_DatepickerSuccess(event.dateAndtime));
      } else if (event is _ColorPicker) {
        emit(_ColorpickerSuccess(event.color));
      } else if (event is _DropDown) {
        emit(_DropDownSuccess(event.value));
      }
    });
  }
}
