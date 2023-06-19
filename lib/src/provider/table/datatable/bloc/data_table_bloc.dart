import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_table_event.dart';
part 'data_table_state.dart';
part 'data_table_bloc.freezed.dart';

class DataTableBloc extends Bloc<DataTableEvent, DataTableState> {
  DataTableBloc() : super(const _Initial()) {
    on<DataTableEvent>((event, emit) {
      emit(const _Initial());
      if (event is _Rebuild) {
        emit(const _Success());
      }
    });
  }
}
