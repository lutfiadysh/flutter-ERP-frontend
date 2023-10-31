part of 'listing_create_bloc.dart';

class ListingCreateEvent extends Equatable {
  const ListingCreateEvent();

  @override
  List<Object> get props => [];
}

class NavigateAddList extends ListingCreateEvent {}

class AddProductList extends ListingCreateEvent {
  final ProductoElement productElement;

  const AddProductList({required this.productElement});

  @override
  List<Object> get props => [productElement];
}

class BackToInitial extends ListingCreateEvent {}

class NavigateSelectClient extends ListingCreateEvent {}

class SelectClient extends ListingCreateEvent {
  final String name;
  final String nit;
  final String ci;
  final String phone;
  final String id;

  const SelectClient({
    required this.name,
    required this.nit,
    required this.ci,
    required this.phone,
    required this.id,
  });

  @override
  List<Object> get props => [name, nit, ci, phone];
}
