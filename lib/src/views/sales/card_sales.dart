import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardSales extends StatefulWidget {
  final List<Venta> ventas;

  const CardSales({Key? key, required this.ventas}) : super(key: key);

  @override
  State<CardSales> createState() => _CardSalesState();
}

class _CardSalesState extends State<CardSales> {
  bool showMessage = false;
  late Venta ventaById;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          showMessage = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final salesProvider = Provider.of<SalesProvider>(context);

    if (widget.ventas.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen ventas, agrega una.',
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
          onTap: () async {
            ventaById = await salesProvider.getSaleById(venta.id);
            salesProvider.selectVenta(ventaById);
            AutoTabsRouter.of(context).setActiveIndex(47);
          },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text('Cliente: ${venta.cotizacion.cliente.nombre}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(venta.cotizacion.cliente.nit != null
                      ? 'NIT: ${venta.cotizacion.cliente.nit}'
                      : venta.cotizacion.cliente.ci != null
                          ? 'CI: ${venta.cotizacion.cliente.ci}'
                          : 'Sin identificación'),
                  Text('Venta por: ${venta.usuario.nombre}'),
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
