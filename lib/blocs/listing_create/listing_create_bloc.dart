import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:admin_dashboard/proy/models/client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_create_event.dart';
part 'listing_create_state.dart';

class ListingCreateBloc extends Bloc<ListingCreateEvent, ListingCreateState> {
  ListingCreateBloc() : super(ListingCreateInitial()) {
    on<BackToInitial>(mapBackToInitialToState);
    on<NavigateAddList>(mapNavigateAddListToState);

    on<AddProductList>(mapAddProductListToState);

    on<NavigateSelectClient>(mapNavigateSelectClientToState);

    on<SelectClient>(mapSelectClientToState);
  }

  void mapBackToInitialToState(BackToInitial event, emit) {
    emit(ListingCreateInitial());
  }

  void mapNavigateAddListToState(NavigateAddList event, emit) {
    emit(NavigatedAddList());
  }

  void mapAddProductListToState(AddProductList event, emit) {
    emit(AddedProductList(productoElement: event.productElement));
    emit(ListingCreateInitial());
  }

  void mapNavigateSelectClientToState(NavigateSelectClient event, emit) {
    emit(NavigatedSelectClient());
  }

  void mapSelectClientToState(SelectClient event, emit) {
    emit(SelectedClient(
        name: event.name,
        nit: event.nit,
        ci: event.ci,
        phone: event.phone,
        id: event.id));

    emit(ListingCreateInitial());
  }
}
