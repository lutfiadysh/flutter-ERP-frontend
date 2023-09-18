import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:admin_dashboard/src/views/movements/salemovementsview_test.dart';
import 'package:flutter/material.dart';

class CardSalesMovements extends StatefulWidget {
  final List<Venta> ventas;

  const CardSalesMovements({Key? key, required this.ventas}) : super(key: key);

  @override
  State<CardSalesMovements> createState() => _CardSalesMovementsState();
}

class _CardSalesMovementsState extends State<CardSalesMovements> {
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
    if (widget.ventas.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen ventas.',
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
        final venta = widget.ventas[index];
        return InkWell(
          onTap: () {
            // Navega a la vista SaleMovementsView al hacer tap en una venta
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaleMovementsView(saleId: venta.id),
              ),
            );
          },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Cliente:${venta.cotizacion.cliente}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIT o CI:${venta.cotizacion.cliente.nit}'),
                  Text('Venta por ${venta.usuario.nombre}'),
                  Text(
                      'Fecha: ${venta.fechaVenta.toLocal().toString().split(' ')[0]}'),
                  Text('Cotización Total: ${venta.cotizacion.total}'),
                  Text('Estado: ${venta.estado}'),
                ],
              ),
              trailing: CircleAvatar(
                  child: venta.estado == 'Pendiente'
                      ? const Icon(Icons.timelapse) // Ícono de espera
                      : venta.estado == 'Pagado'
                          ? const Icon(Icons.payment) // Ícono de pagado
                          : venta.estado == 'Entregado'
                              ? const Icon(
                                  Icons.local_shipping) // Ícono de entregado
                              : const Icon(Icons
                                  .block) // Ícono de anulada para cualquier otro estado
                  ),
            ),
          ),
        );
      },
      itemCount: widget.ventas.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
