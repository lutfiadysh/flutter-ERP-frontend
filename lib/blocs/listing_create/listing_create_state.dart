part of 'listing_create_bloc.dart';

class ListingCreateState extends Equatable {
  const ListingCreateState();

  @override
  List<Object> get props => [];
}

class ListingCreateInitial extends ListingCreateState {}

class NavigatedAddList extends ListingCreateState {}

class AddedProductList extends ListingCreateState {
  final ProductoElement productoElement;

  const AddedProductList({required this.productoElement});

  @override
  List<Object> get props => [productoElement];
}

class NavigatedSelectClient extends ListingCreateState {}

class SelectedClient extends ListingCreateState {
  final String id;
  final String name;
  final String nit;
  final String ci;
  final String phone;

  const SelectedClient({
    required this.name,
    required this.nit,
    required this.ci,
    required this.phone,
    required this.id,
  });

  @override
  List<Object> get props => [name, nit, ci, phone, id];
}
