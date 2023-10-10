import 'package:admin_dashboard/proy/models/order.dart';
import 'package:admin_dashboard/src/views/movements/order_movements_view.dart';
import 'package:flutter/material.dart';

class CardOrdersMovements extends StatefulWidget {
  final List<Pedido> pedidos;

  const CardOrdersMovements({Key? key, required this.pedidos})
      : super(key: key);

  @override
  State<CardOrdersMovements> createState() => _CardSalesMovementsState();
}

class _CardSalesMovementsState extends State<CardOrdersMovements> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showMessage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pedidos.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen pedidos.',
          ),
        );
      } else {
        return const Center(
            child:
                CircularProgressIndicator(color: Colors.white, strokeWidth: 2));
      }
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        final pedido = widget.pedidos[index];
        return InkWell(
          onTap: () {
            // Navega a la vista SaleMovementsView al hacer tap en una pedido
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderMovementsView(orderID: pedido.id),
              ),
            );
          },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Proveedor:${pedido.proveedor.nombre}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pedido por ${pedido.creadoPor.nombre}'),
                  Text(
                      'Fecha: ${pedido.fecha.toLocal().toString().split(' ')[0]}'),
                  Text('Estado: ${pedido.pedido ? 'Pedido' : 'En espera'}'),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.pedidos.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
