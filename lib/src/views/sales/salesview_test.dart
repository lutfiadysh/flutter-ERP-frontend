import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/src/views/sales/card_sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SalesViewTest extends StatefulWidget {
  const SalesViewTest({super.key});

  @override
  State<SalesViewTest> createState() => _SalesViewTestState();
}

class _SalesViewTestState extends State<SalesViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<SalesProvider>(context, listen: false).getSales();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final sales = Provider.of<SalesProvider>(context).ventas;

    return SizedBox(
        height: size.height - 210,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Ventas"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_rounded),
          ),
          body: CardSales(ventas: sales),
        ));
  }
}
