import 'package:admin_dashboard/proy/providers/listings_provider.dart';
import 'package:admin_dashboard/src/views/listings/card_listings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ListingsViewTest extends StatefulWidget {
  const ListingsViewTest({super.key});

  @override
  State<ListingsViewTest> createState() => _ListingsViewTestState();
}

class _ListingsViewTestState extends State<ListingsViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<ListingsProvider>(context, listen: false).getListings();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabsRouter = AutoTabsRouter.of(context);
    final cotizaciones = Provider.of<ListingsProvider>(context).cotizaciones;

    return SizedBox(
      height: size.height - 210,
      child: Scaffold(
        appBar: AppBar(title: const Text("Cotizaciones")),
        body: CardsListingsViewTest(
          cotizaciones: cotizaciones,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ListingsProvider>(context, listen: false)
                .deselectCotizacion();

            tabsRouter.setActiveIndex(45);
          },
          child: const Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
