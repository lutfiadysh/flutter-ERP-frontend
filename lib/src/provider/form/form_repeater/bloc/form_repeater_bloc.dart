import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_repeater_event.dart';
part 'form_repeater_state.dart';
part 'form_repeater_bloc.freezed.dart';

class FormRepeaterBloc extends Bloc<FormRepeaterEvent, FormRepeaterState> {
  FormRepeaterBloc() : super(const _Initial()) {
    on<FormRepeaterEvent>((event, emit) {
      emit(const _Initial());
      if (event is _Add) {
        emit(FormRepeaterState.addSuceess(
          event.fileName,
          event.nameController,
          event.emailController,
          event.subjectController,
          event.messageController,
        ));
      } else if (event is _Delete) {
        emit(FormRepeaterState.deleteSuceess(event.index));
      } else if (event is _AddFile) {
        emit(FormRepeaterState.addFileSuceess(event.fileName, event.index));
      } else if (event is _AddPhone) {
        emit(FormRepeaterState.addPhoneSuceess(event.phoneController));
      } else if (event is _DeletePhone) {
        emit(FormRepeaterState.deletePhoneSuceess(event.index));
      } else if (event is _RadioSelect) {
        emit(FormRepeaterState.radioSelectSuceess(event.value));
      }
    });
  }
}
