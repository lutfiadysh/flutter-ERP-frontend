import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/listings_provider.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/views/listings/addproduct_dialog.dart';
import 'package:admin_dashboard/src/views/listings/listing_table.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ListingViewTest extends StatefulWidget {
  const ListingViewTest({Key? key}) : super(key: key);

  @override
  _ListingViewTestState createState() => _ListingViewTestState();
}

class _ListingViewTestState extends State<ListingViewTest> {
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

  int getTotalCajas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadCajas ?? 0));
  }

  int getTotalPiezas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadPiezas ?? 0));
  }

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabsRouter = AutoTabsRouter.of(context);
    final listingProvider =
        Provider.of<ListingsProvider>(context, listen: false);

    final saleProvider = Provider.of<SalesProvider>(context, listen: false);

    return SizedBox(
      height: size.height - 80 - 90,
      child: Scaffold(
        appBar: AppBar(
          title: isEditing
              ? const Text("Editar Cotizacion")
              : const Text("Nueva Cotizacion"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => tabsRouter.setActiveIndex(43),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'Reservar') {
                  // Aquí va tu lógica para manejar la reserva

                  if (productos.isEmpty) {
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
                      await listingProvider.createReserve(productos, clientName,
                          clientNIT, clientCI, clientID, clientPhone);
                      tabsRouter.setActiveIndex(43);
                      NotificationsService.showSnackbar(
                          'Productos reservados con éxito.');
                    } catch (e) {
                      print(e);
                      NotificationsService.showSnackbarError(
                          'No se pudo reservar los productos.');
                    }
                  }
                } else if (value == 'Guardar') {
                  if (productos.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo crear la cotización, agregue al menos un producto.');
                  } else if (clientName.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo crear la cotización, agregue el nombre del cliente.');
                  } else {
                    try {
                      isEditing
                          ? await listingProvider.updateListing(
                              selectedCotizacion!.id, productos)
                          : await listingProvider.newListing(
                              productos,
                              clientName,
                              clientNIT,
                              clientCI,
                              clientID,
                              clientPhone);
                      tabsRouter.setActiveIndex(43);
                      NotificationsService.showSnackbar(
                        isEditing
                            ? 'Cotización editada con éxito.'
                            : 'Cotización creada con éxito.',
                      );
                    } catch (e) {
                      NotificationsService.showSnackbarError(
                        isEditing
                            ? 'No se pudo actualizar la cotizacion.'
                            : 'No se pudo crear la cotizacion.',
                      );
                    }
                  }
                } else if (value == 'Vender') {
                  if (productos.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo realizar la venta, agregue al menos un producto.');
                  } else if (clientName.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo realizar la venta, agregue el nombre del cliente.');
                  } else {
                    try {
                      await saleProvider.newSale(selectedCotizacion!.id);
                      tabsRouter.setActiveIndex(43);
                      NotificationsService.showSnackbar(
                          'Venta realizada con éxito.');
                    } catch (e) {
                      NotificationsService.showSnackbarError(
                          'No se pudo realizar la venta.');
                    }
                  }
                } else if (value == 'Generar PDF' && isEditing) {
                  await listingProvider.createPdf(selectedCotizacion!);
                }
              },
              itemBuilder: (BuildContext context) {
                List<String> options;

                if (!enoughStock) {
                  options = ['Reservar'];
                } else {
                  if (selectedCotizacion != null) {
                    if (selectedCotizacion!.vendido) {
                      options = ['Generar PDF'];
                    } else {
                      options = ['Generar PDF', 'Vender', 'Guardar'];
                    }
                  } else {
                    options = ['Guardar'];
                  }
                }

                return options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              icon: const Icon(Icons.more_vert),
              tooltip: "Opciones",
            ),
          ],
        ),
        body: ListingTable(
          onCheckStock: checkStockAvailability,
          total: total,
          sellerName: sellerName,
          date: date,
          productos: productos,
          clientNIT: clientNIT,
          clientName: clientName,
          clientCI: clientCI,
          clientPhone: clientPhone,
          clienteID: '',
          onClientNameChanged: (newName) {
            setState(() {
              clientName = newName;
            });
          },
          onClientNITChanged: (newNIT) {
            setState(() {
              clientNIT = newNIT;
            });
          },
          onEditClient: (newClientID) {
            setState(() {
              clientID = newClientID;
            });
          },
          onClientCIChanged: (newCi) {
            setState(() {
              clientCI = newCi;
            });
          },
          onClientPhoneChanged: (newPhone) {
            setState(() {
              clientPhone = newPhone;
            });
          },
          onEnouchStockChanged: (newEnouchStock) {
            setState(() {
              enoughStock = newEnouchStock;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AddProductDialog(
                onProductAdded: (producto) {
                  setState(() {
                    productos.add(producto);
                    total += producto.precioTotal;

                    // Verificar el stock disponible
                    enoughStock = checkStockAvailability(productos);
                  });
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

//funcion para verificar disponibilidad del stock
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
}
