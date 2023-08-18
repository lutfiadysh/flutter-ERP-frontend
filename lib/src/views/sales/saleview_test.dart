import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SaleViewTest extends StatefulWidget {
  const SaleViewTest({Key? key}) : super(key: key);

  @override
  State<SaleViewTest> createState() => _SaleViewTestState();
}

class _SaleViewTestState extends State<SaleViewTest> {
  late Venta selectedVenta;

  @override
  void initState() {
    super.initState();
    final salesProvider = Provider.of<SalesProvider>(context, listen: false);
    if (salesProvider.selectedVenta != null) {
      selectedVenta = salesProvider.selectedVenta!;
    }
  }

  int sumatoriaStocksParaProducto(String productoId, {required bool esCaja}) {
    final stocksProvider = Provider.of<StocksProvider>(context, listen: false);
    return stocksProvider.stocks
        .where((stock) => stock.producto.id == productoId)
        .fold(
            0,
            (acc, stock) => esCaja
                ? acc + (stock.cantidadCajas ?? 0)
                : acc + (stock.cantidadPiezas ?? 0));
  }

  bool stockSatisfaceDemanda(
      String productoId, int cantidadCajas, int cantidadPiezas) {
    final totalCajas = sumatoriaStocksParaProducto(productoId, esCaja: true);
    final totalPiezas = sumatoriaStocksParaProducto(productoId, esCaja: false);
    return totalCajas >= cantidadCajas && totalPiezas >= cantidadPiezas;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final tabsRouter = AutoTabsRouter.of(context);
    final salesProvider = Provider.of<SalesProvider>(context);

    return SizedBox(
      height: height - 210,
      child: FutureBuilder(
        future: Provider.of<StocksProvider>(context, listen: false).getStocks(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Detalle de Venta'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => tabsRouter.setActiveIndex(46),
                ),
                actions: <Widget>[
                  PopupMenuButton<String>(
                    onSelected: (String result) {
                      if (result == 'Registrar pago') {
                        salesProvider.registerPay(selectedVenta.id);
                      } else if (result == 'Anular venta') {
                        print('Anular venta');
                      } else if (result == 'Facturar') {
                        print('Facturar');
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      if (selectedVenta.estado == 'Pendiente')
                        const PopupMenuItem<String>(
                          value: 'Registrar pago',
                          child: Text('Registrar pago'),
                        ),
                      if (selectedVenta.estado == 'Pendiente')
                        const PopupMenuItem<String>(
                          value: 'Anular venta',
                          child: Text('Anular venta'),
                        ),
                      if (selectedVenta.estado == 'Pagado')
                        const PopupMenuItem<String>(
                          value: 'Facturar',
                          child: Text('Facturar'),
                        ),
                    ],
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Información de Venta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Usuario: ${selectedVenta.usuario.nombre}'),
                            Text('Estado: ${selectedVenta.estado}'),
                            Text(
                                'Fecha: ${selectedVenta.fechaVenta.toLocal().toString().split(' ')[0]}'),
                            Text(
                                'Total Cotización: ${selectedVenta.cotizacion.total}'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Productos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                      },
                      children: [
                        const TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Producto',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Cantidad',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Total',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        ...selectedVenta.cotizacion.productos.map((producto) {
                          final enStock = stockSatisfaceDemanda(
                              producto.producto.id,
                              producto.cantidadCajas,
                              producto.cantidadPiezas);
                          final stockColor =
                              enStock ? Colors.green : Colors.red;

                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(producto.producto.nombre,
                                    style: TextStyle(color: stockColor)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    '${producto.cantidadCajas} cajas, ${producto.cantidadPiezas} piezas'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${producto.precioTotal}'),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Movimientos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...selectedVenta.movimientos.map((movimiento) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: movimiento.stock.producto.img != null
                                    ? Image.network(
                                        movimiento.stock.producto.img!,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.image,
                                        color: Colors.grey[400]),
                              ),
                            ),
                            title: Text(
                                'Producto: ${movimiento.stock.producto.nombre}'),
                            subtitle: Text(
                                'Cantidad Cajas: ${movimiento.cantidadCajas}, Cantidad Piezas: ${movimiento.cantidadPiezas}'),
                            trailing: movimiento.verificacion == 'EN ESPERA'
                                ? const Icon(Icons.timelapse)
                                : const Icon(Icons.check),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
