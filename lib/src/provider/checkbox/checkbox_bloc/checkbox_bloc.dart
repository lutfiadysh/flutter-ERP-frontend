import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkbox_event.dart';
part 'checkbox_state.dart';
part 'checkbox_bloc.freezed.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(const _Success(false)) {
    on<CheckboxEvent>((event, emit) {
      if (event is _Started) {
        emit(_Success(event.isChecked));
      }
    });
  }
}
