import 'package:admin_dashboard/proy/models/order.dart';
import 'package:admin_dashboard/proy/models/reserve.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/orders_provider.dart';
import 'package:admin_dashboard/proy/providers/reserves_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/views/orders/addorder_dialog.dart';
import 'package:admin_dashboard/src/views/orders/order_table.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OrderViewTest extends StatefulWidget {
  const OrderViewTest({Key? key}) : super(key: key);

  @override
  _OrderViewTestState createState() => _OrderViewTestState();
}

class _OrderViewTestState extends State<OrderViewTest> {
  List<ProductoDetalle> productos = [];
  double total = 0;
  String? providerID;
  String providerName = '';
  String userName = 'Nombre del usuario';
  String providerPhone = '';
  String id = 'Pedido ID';
  DateTime date = DateTime.now();
  Pedido? selectedPedido;
  bool isEditing = false;
  bool enoughStock = true;
  List<Reserva> reservas = [];

  @override
  void initState() {
    super.initState();
    isEditing = false;
    final userFormProvider = Provider.of<AuthProvider>(context, listen: false);
    final orderProvider = Provider.of<OrdersProvider>(context, listen: false);
    if (orderProvider.selectedPedido != null) {
      selectedPedido = orderProvider.selectedPedido!;
      productos = selectedPedido!.productoDetalles;
      providerName = selectedPedido!.proveedor.nombre;
      providerID = selectedPedido!.proveedor.id;
      providerPhone = selectedPedido!.proveedor.telefono ?? "Sin telefono";
      date = selectedPedido!.fecha;
      userName = selectedPedido!.creadoPor.nombre;
      id = selectedPedido!.id;
      isEditing = true;
    } else {
      userName = userFormProvider.user!.nombre;
    }
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reservesProvider =
          Provider.of<ReservesProvider>(context, listen: false);
      reservesProvider.getReserves().then((value) {
        setState(() {
          reservas = reservesProvider.reservas;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabsRouter = AutoTabsRouter.of(context);
    final orderProvider = Provider.of<OrdersProvider>(context, listen: false);

    return SizedBox(
      height: size.height - 80 - 90,
      child: Scaffold(
        appBar: AppBar(
          title: isEditing
              ? const Text("Editar Pedido")
              : const Text("Nuevo Pedido"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => tabsRouter.setActiveIndex(49),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'Guardar') {
                  if (productos.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo crear el pedido, agregue al menos un producto.');
                  } else {
                    try {
                      isEditing
                          ? await orderProvider.updateOrder(
                              selectedPedido!.id, productos)
                          : await orderProvider.newOrder(productos);
                      tabsRouter.setActiveIndex(49);
                      NotificationsService.showSnackbar(
                        isEditing
                            ? 'Pedido editado con éxito.'
                            : 'Pedido guardado con éxito.',
                      );
                    } catch (e) {
                      print(e);
                      NotificationsService.showSnackbarError(
                        isEditing
                            ? 'No se pudo actualizar el pedido.'
                            : 'No se pudo guardar el pedido.',
                      );
                    }
                  }
                } else if (value == 'Realizar Pedido') {
                  if (productos.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo realizar el pedido, agregue al menos un producto.');
                  } else if (providerName.isEmpty) {
                    NotificationsService.showSnackbarError(
                        'No se pudo realizar el pedido, agregue el nombre del proveedor.');
                  } else {
                    try {
                      print("Creando pedido...");
                      await orderProvider
                          .createOrderMovements(selectedPedido!.id);
                      tabsRouter.setActiveIndex(49);
                      NotificationsService.showSnackbar(
                          'Pedido realizado con éxito.');
                    } catch (e) {
                      print(e);
                      NotificationsService.showSnackbarError(
                          'No se pudo realizar el pedido.');
                    }
                  }
                } else if (value == 'Generar PDF' && isEditing) {
                  await orderProvider.createPdfOrder(selectedPedido!);
                }
              },
              itemBuilder: (BuildContext context) {
                List<String> options;

                if (selectedPedido != null) {
                  if (selectedPedido!.pedido) {
                    options = ['Generar PDF'];
                  } else {
                    options = ['Generar PDF', 'Realizar Pedido', 'Guardar'];
                  }
                } else {
                  options = ['Guardar'];
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
        body: OrderTable(
          userName: userName,
          date: date,
          productos: productos,
          providerName: providerName,
          providerPhone: providerPhone,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AddOrderDialog(
                onProductAdded: (producto) {
                  setState(() {
                    productos.add(producto);
                  });
                },
                proveedorId: providerID,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
