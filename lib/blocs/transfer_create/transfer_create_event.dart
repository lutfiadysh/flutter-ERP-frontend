part of 'transfer_create_bloc.dart';

class TransferCreateEvent extends Equatable {
  const TransferCreateEvent();

  @override
  List<Object> get props => [];
}

class NavigateTransferCreateList extends TransferCreateEvent {}

class TransferAddListNote extends TransferCreateEvent {
  final Note note;

  const TransferAddListNote({required this.note});

  @override
  List<Object> get props => [note];
}
