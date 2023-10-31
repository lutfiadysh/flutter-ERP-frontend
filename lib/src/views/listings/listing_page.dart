import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/listings/create_listing_list_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../proy/providers/listings_provider.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  double total = 0;
  String clientID = 'ID del cliente';
  String clientName = '';
  String clientNIT = '';
  String sellerName = 'Nombre del vendedor';
  String clientCI = '';
  String clientPhone = '';
  String id = 'Cotizacion ID';
  DateTime date = DateTime.now();
  Cotizacion? selectedCotizacion;
  bool isEditing = false;
  bool enoughStock = true;
  List<Stock> stocks = [];
  List<ProductoElement> productosElement = [];
  @override
  void initState() {
    super.initState();

    Provider.of<ListingsProvider>(context, listen: false).getListings();
  }

  @override
  Widget build(BuildContext context) {
    final cotizaciones =
        Provider.of<ListingsProvider>(context, listen: false).cotizaciones;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            Strings.listings,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateListingListPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(
                  EneftyIcons.add_bold,
                ),
              ),
            ),
          ],
        ),
        body: cotizaciones.isNotEmpty
            ? Column(
                children: cotizaciones.map((e) {
                  return Text(e.cliente.nombre);
                }).toList(),
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
      ),
    );
  }
}
