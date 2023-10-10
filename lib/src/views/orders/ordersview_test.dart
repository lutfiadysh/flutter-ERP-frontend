import 'package:admin_dashboard/proy/providers/orders_provider.dart';
import 'package:admin_dashboard/src/views/orders/card_orders.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OrdersViewTest extends StatefulWidget {
  const OrdersViewTest({super.key});

  @override
  State<OrdersViewTest> createState() => _OrdersViewTestState();
}

class _OrdersViewTestState extends State<OrdersViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabsRouter = AutoTabsRouter.of(context);
    final pedidos = Provider.of<OrdersProvider>(context).pedidos;

    return SizedBox(
      height: size.height - 210,
      child: Scaffold(
        appBar: AppBar(title: const Text("Pedidos")),
        body: CardsOrders(
          pedidos: pedidos,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<OrdersProvider>(context, listen: false)
                .deselectCotizacion();

            tabsRouter.setActiveIndex(50);
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
