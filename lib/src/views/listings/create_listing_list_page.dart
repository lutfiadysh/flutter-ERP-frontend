import 'dart:developer';

import 'package:admin_dashboard/blocs/listing_create/listing_create_bloc.dart';
import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/clients_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/listings/create_listing_page.dart';
import 'package:admin_dashboard/src/views/listings/listing_select_client_page.dart';
import 'package:admin_dashboard/src/views/listings/listingview_test.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../proy/providers/listings_provider.dart';

class CreateListingListPage extends StatefulWidget {
  const CreateListingListPage({
    super.key,
  });

  @override
  State<CreateListingListPage> createState() => _CreateListingListPageState();
}

class _CreateListingListPageState extends State<CreateListingListPage> {
  List<ProductoElement> productos = [];
  double total = 0;
  String clientID = 'ID del cliente';
  String clientName = '';
  String clientNIT = '';
  String sellerName = 'Nombre del vendedor';
  String clientCI = '';
  String clientPhone = '';
  String id = 'Cotizacion ID';
  DateTime date = DateTime.now();
  Cotizacion? selectedCotizacion;
  bool isEditing = false;
  bool enoughStock = true;
  List<Stock> stocks = [];
  Cliente? selectedClient;

  bool isOpenClient = true;

  int getTotalCajas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadCajas ?? 0));
  }

  int getTotalPiezas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadPiezas ?? 0));
  }

  var listingCreateBloc = ListingCreateBloc();
  List<ProductoElement> list = [];

  @override
  void initState() {
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
    final listingProvider =
        Provider.of<ListingsProvider>(context, listen: false);
    final String fecha = dateFormatter.format(DateTime.now());
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: BlocProvider(
        create: (context) => listingCreateBloc,
        child: BlocConsumer<ListingCreateBloc, ListingCreateState>(
          listener: (context, state) {
            if (state is AddedProductList) {
              setState(() {
                list.add(state.productoElement);
              });
            }
            if (state is SelectedClient) {
              setState(() {
                clientName = state.name;
                clientCI = state.ci;
                clientNIT = state.nit;
                clientPhone = state.phone;
              });
            }
          },
          builder: (context, state) {
            if (state is NavigatedAddList) {
              return const CreateListingPage();
            }
            if (state is NavigatedSelectClient) {
              return ListingSelectClientPage();
            }
            return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
                centerTitle: false,
                titleSpacing: 0,
                title: const Text(
                  "Nueva Cotizacio",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      listingCreateBloc.add(NavigateAddList());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        EneftyIcons.add_bold,
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  //// HEADERS
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Vendedor",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                sellerName.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConst.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Fecha",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                fecha.isNotEmpty ? fecha.toString() : '-',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConst.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Cliente",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                listingCreateBloc.add(NavigateSelectClient());
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        FxBox.h12,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Cliente",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    clientName.isNotEmpty
                                        ? clientName.toString()
                                        : '-',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Teléfono",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    clientPhone.isNotEmpty
                                        ? clientPhone.toString()
                                        : '-',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "NIT",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    clientNIT.isNotEmpty
                                        ? clientNIT.toString()
                                        : '-',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "CI",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    clientCI.isNotEmpty
                                        ? clientCI.toString()
                                        : '-',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //// HEADERS
                  if (list.isEmpty)
                    Column(
                      children: [
                        FxBox.h32,
                        Lottie.asset(
                          'assets/empty_product.json',
                          width: MediaQuery.of(context).size.width / 1.5,
                        ),
                        const Text(
                          "No Product added",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FxBox.h16,
                        ElevatedButton(
                          onPressed: () {
                            listingCreateBloc.add(NavigateAddList());
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width / 2, 50),
                            backgroundColor: ColorConst.primary,
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  FxBox.h28,
                  Column(
                    children: list.map((e) {
                      var index = list.indexOf(e);
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.width / 7,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            e.producto!.img.toString()),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.producto!.nombre,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("${e.cantidadCajas} Cajas"),
                                      Text("${e.cantidadPiezas} Piezas")
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    list.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          calculateTotal(list).toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorConst.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        log(list.length.toString());
                        if (list.isEmpty) {
                          NotificationsService.showSnackbarError(
                              'No se pudo reservar los productos, agregue al menos un producto.');
                        } else if (clientName.isEmpty) {
                          NotificationsService.showSnackbarError(
                              'No se pudo reservar la cotización, agregue el nombre del cliente.');
                        } else if (clientPhone.isEmpty) {
                          NotificationsService.showSnackbarError(
                              'No se pudo reservar la cotización, agregue el numero de telefono del cliente.');
                        } else {
                          try {
                            if (enoughStock) {
                              await listingProvider.newListing(
                                  productos,
                                  clientName,
                                  clientNIT,
                                  clientCI,
                                  clientID,
                                  clientPhone);
                            } else {
                              await listingProvider.createReserve(
                                  productos,
                                  clientName,
                                  clientNIT,
                                  clientCI,
                                  clientID,
                                  clientPhone);
                            }

                            NotificationsService.showSnackbar(
                                'Productos reservados con éxito.');
                            Navigator.pop(context);
                          } catch (e) {
                            log(e.toString());
                            NotificationsService.showSnackbarError(
                                'No se pudo reservar los productos.');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 2, 40),
                        backgroundColor: ColorConst.blue,
                      ),
                      child: Text(
                        enoughStock ? "Guardar" : "Reservar",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool checkStockAvailability(List<ProductoElement> productos) {
    bool stockIsEnough = true;
    for (var producto in productos) {
      int totalCajas = getTotalCajas(producto.producto!.id);
      int totalPiezas = getTotalPiezas(producto.producto!.id);
      if (totalCajas < producto.cantidadCajas ||
          totalPiezas < producto.cantidadPiezas) {
        stockIsEnough = false;
        break; // Salir del ciclo tan pronto como se encuentre un producto sin stock suficiente.
      }
    }

    setState(() {
      enoughStock = stockIsEnough; // Actualizar el valor de 'enoughStock'
    });

    return stockIsEnough;
  }

  void init() {
    isEditing = false;
    final userFormProvider = Provider.of<AuthProvider>(context, listen: false);
    final listingProvider =
        Provider.of<ListingsProvider>(context, listen: false);
    if (listingProvider.selectedCotizacion != null) {
      selectedCotizacion = listingProvider.selectedCotizacion!;
      productos = selectedCotizacion!.productos;
      clientName = selectedCotizacion!.cliente.nombre;
      clientNIT = selectedCotizacion!.cliente.nit ?? "Sin NIT";
      clientCI = selectedCotizacion!.cliente.ci ?? "Sin CI";
      clientPhone = selectedCotizacion!.cliente.telefono ?? "Sin telefono";
      clientID = selectedCotizacion!.cliente.id;
      date = selectedCotizacion!.fecha;
      sellerName = selectedCotizacion!.usuario.nombre;
      id = selectedCotizacion!.id;
      isEditing = true;
    } else {
      sellerName = userFormProvider.user!.nombre;
    }
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final stocksProvider =
          Provider.of<StocksProvider>(context, listen: false);
      stocksProvider.getStocks().then((value) {
        setState(() {
          stocks = stocksProvider.stocks;
          enoughStock = checkStockAvailability(productos);
        });
      });
    });
  }

  double calculateTotal(List<ProductoElement> productos) {
    return productos.fold(0, (double total, ProductoElement producto) {
      final totalCajas =
          producto.cantidadCajas * (producto.precioUnitarioCajas);
      final totalPiezas =
          producto.cantidadPiezas * (producto.precioUnitarioPiezas);
      return total + totalCajas + totalPiezas;
    });
  }
}
