import 'package:admin_dashboard/proy/models/order.dart';
import 'package:admin_dashboard/proy/providers/orders_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardsOrders extends StatefulWidget {
  final List<Pedido> pedidos;

  const CardsOrders({Key? key, required this.pedidos}) : super(key: key);

  @override
  _CardOrdersState createState() => _CardOrdersState();
}

class _CardOrdersState extends State<CardsOrders> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    // Después de 5 segundos, si todavía no hay pedidos, muestra el mensaje
    Future.delayed(const Duration(seconds: 5), () {
      if (widget.pedidos.isEmpty) {
        setState(() {
          showMessage = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final pedidos = ordersProvider.pedidos;

    if (pedidos.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen pedidos, agrega una.',
          ),
        );
      } else {
        return const Center(
            child:
                CircularProgressIndicator(color: Colors.white, strokeWidth: 2));
      }
    }

    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        final pedido = pedidos[index];
        final formattedDate = _formatDate(pedido.fecha);

        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fecha: $formattedDate",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Estado: ${pedido.pedido ? 'Completado' : 'Pendiente'}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Proveedor: ${pedido.proveedor.nombre}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Creado por: ${pedido.creadoPor.nombre}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Productos: ${pedido.productoDetalles.map((detalle) => detalle.producto?.nombre ?? 'Desconocido').join(', ')}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Total de cajas: ${pedido.productoDetalles.map((e) => e.cantidadCajas).reduce((a, b) => a + b)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )),
            onTap: () {
              ordersProvider.selectCotizacion(pedido);
              AutoTabsRouter.of(context).setActiveIndex(50);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}

String _formatDate(DateTime date) {
  var now = DateTime.now();
  var difference = now.difference(date);

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return "hace $years año${years == 1 ? '' : 's'}";
  } else if (difference.inDays > 30) {
    int months = (difference.inDays / 30).floor();
    return "hace $months mes${months == 1 ? '' : 'es'}";
  } else {
    if (difference.inDays > 0) {
      return "hace ${difference.inDays} día${difference.inDays == 1 ? '' : 's'}";
    } else if (difference.inHours > 0) {
      return "hace ${difference.inHours} hora${difference.inHours == 1 ? '' : 's'}";
    } else {
      return "hace ${difference.inMinutes} minuto${difference.inMinutes == 1 ? '' : 's'}";
    }
  }
}
