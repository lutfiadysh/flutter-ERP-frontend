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
          onTap: () {
            salesProvider.selectVenta(venta);
            AutoTabsRouter.of(context).setActiveIndex(47);
          },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    venta.estado == 'Pendiente' ? Colors.yellow : Colors.green,
                child: const Icon(Icons.local_shipping),
              ),
              title: Text('Venta por ${venta.usuario.nombre}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Fecha: ${venta.fechaVenta.toLocal().toString().split(' ')[0]}'),
                  Text('Cotización Total: ${venta.cotizacion.total}'),
                  Text('Estado: ${venta.estado}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                  const Icon(Icons.chevron_right),
                ],
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
