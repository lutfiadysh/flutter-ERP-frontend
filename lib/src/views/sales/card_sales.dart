import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/views/sales/sales_view_detail_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
        return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  width: MediaQuery.of(context).size.width - 32,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            });
      }
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        final venta = widget.ventas[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SalesViewDetailPage(sale: venta)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    color: ColorConst.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        venta.cotizacion.cliente.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      venta.estado == 'Pendiente'
                          ? const Icon(
                              Icons.timelapse,
                              color: Colors.white,
                            ) // Ícono de espera
                          : venta.estado == 'Pagado'
                              ? const Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                ) // Ícono de pagado
                              : venta.estado == 'Entregado'
                                  ? const Icon(
                                      Icons.local_shipping,
                                      color: Colors.white,
                                    ) // Ícono de entregado
                                  : const Icon(
                                      Icons.block,
                                      color: Colors.white,
                                    )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(venta.cotizacion.cliente.nit != null
                          ? 'NIT: '
                          : venta.cotizacion.cliente.ci != null
                              ? 'CI: '
                              : 'Sin identificación'),
                      Text(venta.cotizacion.cliente.nit != null
                          ? ' ${venta.cotizacion.cliente.nit}'
                          : venta.cotizacion.cliente.ci != null
                              ? '${venta.cotizacion.cliente.ci}'
                              : ''),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Venta por: '),
                      Text(' ${venta.usuario.nombre}'),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Fecha: '),
                      Text(
                          ' ${venta.fechaVenta.toLocal().toString().split(' ')[0]}'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cotización Total:'),
                      Text(' ${venta.cotizacion.total}'),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estado: '),
                      Text('${venta.estado}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
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
