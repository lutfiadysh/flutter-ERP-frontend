import 'package:admin_dashboard/proy/providers/sales_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final tabsRouter = AutoTabsRouter.of(context);
    final salesProvider = Provider.of<SalesProvider>(context);

    return SizedBox(
      height: height - 210,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalle de Venta'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => tabsRouter.setActiveIndex(46),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String result) {
                // Handle menu selection here
                // Add your code like navigating to another page, etc.
                if (result == 'Registrar pago') {
                  salesProvider.registerPay(selectedVenta.id);
                } else if (result == 'Anular venta') {
                  print('Anular venta');
                } else if (result == 'Facturar') {
                  print('Facturar');
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
              // Sale Information
              const Text(
                'Información de Venta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

              // Products Information
              const Text(
                'Productos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                children: [
                  // Header
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Producto',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Cantidad',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Total',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  // Products
                  ...selectedVenta.cotizacion.productos.map((producto) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(producto.producto.nombre),
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

              // Movements Information
              const Text(
                'Movimientos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...selectedVenta.movimientos.map((movimiento) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.sync_alt),
                      title:
                          Text('Producto: ${movimiento.stock.producto.nombre}'),
                      subtitle: Text(
                          'Cantidad Cajas: ${movimiento.cantidadCajas}, Cantidad Piezas: ${movimiento.cantidadPiezas}'),
                      trailing: movimiento.verificacion == 'EN ESPERA'
                          ? const Icon(Icons.timelapse, color: Colors.yellow)
                          : const Icon(Icons.check, color: Colors.green),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
