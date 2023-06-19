part of 'data_table_bloc.dart';

@freezed
class DataTableState with _$DataTableState {
  const factory DataTableState.initial() = _Initial;
  const factory DataTableState.success() = _Success;
}
