import 'package:admin_dashboard/proy/models/note.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_create_event.dart';
part 'transfer_create_state.dart';

class TransferCreateBloc
    extends Bloc<TransferCreateEvent, TransferCreateState> {
  TransferCreateBloc() : super(TransferCreateInitial()) {
    on<NavigateTransferCreateList>(mapNavigateTransferCreateListToState);
    on<TransferAddListNote>(mapTransferAddListNoteToState);
  }

  void mapNavigateTransferCreateListToState(
      NavigateTransferCreateList event, emit) {
    emit(NavigatedTransferCreateList());
  }

  void mapTransferAddListNoteToState(TransferAddListNote event, emit) {
    emit(TransferAddedListNote(note: event.note));
    emit(TransferCreateInitial());
  }
}
