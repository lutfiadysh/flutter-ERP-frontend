import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'editable_table_event.dart';
part 'editable_table_state.dart';
part 'editable_table_bloc.freezed.dart';

class EditableTableBloc extends Bloc<EditableTableEvent, EditableTableState> {
  EditableTableBloc() : super(const _Initial()) {
    on<EditableTableEvent>((event, emit) {
      emit(const _Initial());
      if (event is _Rebuild) {
        emit(const _Success());
      }
    });
  }
}
