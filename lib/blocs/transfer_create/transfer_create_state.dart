part of 'transfer_create_bloc.dart';

class TransferCreateState extends Equatable {
  const TransferCreateState();

  @override
  List<Object> get props => [];
}

class TransferCreateInitial extends TransferCreateState {}

class NavigatedTransferCreateList extends TransferCreateState {}

class TransferAddedListNote extends TransferCreateState {
  final Note note;

  const TransferAddedListNote({required this.note});

  @override
  List<Object> get props => [note];
}
