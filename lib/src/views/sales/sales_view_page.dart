import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/sales/card_sales.dart';
import 'package:admin_dashboard/src/views/sales/create_sales_view_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesViewPage extends StatefulWidget {
  const SalesViewPage({super.key});

  @override
  State<SalesViewPage> createState() => _SalesViewPageState();
}

class _SalesViewPageState extends State<SalesViewPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<SalesProvider>(context, listen: false).getSales();
  }

  @override
  Widget build(BuildContext context) {
    final sales = Provider.of<SalesProvider>(context).ventas;
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
            "Ventas",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateSalesViewPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(
                  EneftyIcons.add_bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: CardSales(ventas: sales),
      ),
    );
  }
}
