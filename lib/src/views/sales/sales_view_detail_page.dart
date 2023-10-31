import 'package:admin_dashboard/proy/models/invoice.dart';
import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class SalesViewDetailPage extends StatefulWidget {
  final Venta sale;
  const SalesViewDetailPage({super.key, required this.sale});

  @override
  State<SalesViewDetailPage> createState() => _SalesViewDetailPageState();
}

class _SalesViewDetailPageState extends State<SalesViewDetailPage> {
  Venta? selectedVenta;
  Factura? selectedFactura;
  Venta? ventaPaymentUpdate;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedVenta = widget.sale;
    });
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            'Detalle de Venta',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (selectedVenta != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: const BoxDecoration(
                          color: ColorConst.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Información de Venta',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Usuario: '),
                            Text('${selectedVenta!.usuario.nombre}'),
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
                            const Text('Cliente: '),
                            Text(
                                ' ${selectedVenta!.cotizacion.cliente.nombre}'),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedVenta!.cotizacion.cliente.nit != null
                                ? 'NIT: '
                                : 'CI:  '),
                            Text(selectedVenta!.cotizacion.cliente.nit != null
                                ? '${selectedVenta!.cotizacion.cliente.nit}'
                                : '${selectedVenta!.cotizacion.cliente.ci ?? 'Sin identificación'}'),
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
                            Text('Estado:'),
                            Text(' ${selectedVenta!.estado}'),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fecha: '),
                            Text(
                                '${selectedVenta!.fechaVenta.toLocal().toString().split(' ')[0]}'),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Cotización: '),
                            Text('${selectedVenta!.cotizacion.total}'),
                          ],
                        ),
                      ),
                      FxBox.h12,
                    ],
                  ),
                ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          color: pageIndex == 0
                              ? ColorConst.blue.withOpacity(.2)
                              : null,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: pageIndex == 0
                                  ? ColorConst.blue
                                  : Colors.grey),
                        ),
                        child: Text(
                          "Producto",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                pageIndex == 0 ? ColorConst.blue : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    FxBox.w16,
                    InkWell(
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          color: pageIndex == 1
                              ? ColorConst.blue.withOpacity(.2)
                              : null,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: pageIndex == 1
                                  ? ColorConst.blue
                                  : Colors.grey),
                        ),
                        child: Text(
                          "Movimientos",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                pageIndex == 1 ? ColorConst.blue : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedVenta != null)
                IndexedStack(
                  index: pageIndex,
                  children: [
                    Column(
                      children: selectedVenta!.cotizacion.productos.map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    height:
                                        MediaQuery.of(context).size.width / 7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          e.producto!.img.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.producto!.nombre,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('${e.cantidadCajas} cajas'),
                                      Text('${e.cantidadPiezas} piezas'),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${e.precioTotal}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConst.teal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    Column(
                        children: selectedVenta!.movimientos.map((e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width / 7,
                                  height: MediaQuery.of(context).size.width / 7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        e.stock.producto.img.toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.stock.producto.nombre,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('${e.cantidadCajas} cajas'),
                                    Text('${e.cantidadPiezas} piezas'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList()),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
