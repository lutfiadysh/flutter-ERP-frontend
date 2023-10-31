import 'package:admin_dashboard/proy/providers/orders_provider_mobile.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/orders/card_orders.dart';
import 'package:admin_dashboard/src/views/orders/create_order_page.dart';
import 'package:admin_dashboard/src/views/orders/ordersview_test.dart';
import 'package:admin_dashboard/src/views/orders/orderview_test.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final pedidos = Provider.of<OrdersProvider>(context).pedidos;
    return Scaffold(
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
          Strings.orders,
          style: TextStyle(
            fontSize: 16,
            color: ColorConst.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateOrderPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const Icon(
                EneftyIcons.add_bold,
              ),
            ),
          ),
        ],
      ),
      body: pedidos.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: pedidos.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              color: Colors.black.withOpacity(.12),
                              blurRadius: 16,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _formatDate(e.fecha),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600]!,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, right: 10),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage(e
                                                .productoDetalles[0]
                                                .producto!
                                                .img
                                                .toString()),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.productoDetalles
                                              .map((detalle) =>
                                                  detalle.producto?.nombre)
                                              .join(', '),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(e.proveedor.nombre),
                                        Text(
                                            "${e.productoDetalles.map((e) => e.cantidadCajas).reduce((a, b) => a + b)} cajas"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: ColorConst.teal.withOpacity(.16),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    e.pedido ? 'Completado' : 'Pendiente',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: e.pedido
                                          ? ColorConst.teal
                                          : ColorConst.error,
                                    ),
                                  ),
                                ),
                                FxBox.h10,
                                Text(e.creadoPor.nombre),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  // CardsOrders(
                  //   pedidos: pedidos,
                  // ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    width: MediaQuery.of(context).size.width - 32,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
    );
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
}
