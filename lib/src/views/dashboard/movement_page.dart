import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/movements/movement_detail_page.dart';
import 'package:admin_dashboard/src/views/movements/movementsview_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MovementPage extends StatefulWidget {
  const MovementPage({super.key});

  @override
  State<MovementPage> createState() => _MovementPageState();
}

class _MovementPageState extends State<MovementPage> {
  String searchQuery = '';
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    Provider.of<MovementsProvider>(context, listen: false)
        .getProductEntriesAndExits();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final movementsProvider = Provider.of<MovementsProvider>(context);

    final productEntries = movementsProvider.productEntries;
    final productExits = movementsProvider.productExits;

    final productIds = {...productEntries.keys, ...productExits.keys}
        .where((productId) =>
            productEntries[productId]!.isNotEmpty ||
            productExits[productId]!.isNotEmpty)
        .toList();

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: ColorConst.black,
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
        title: const Text(
          Strings.movements,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              onChanged: (query) => setState(() async {
                searchQuery = query;
                await Provider.of<MovementsProvider>(context, listen: false)
                    .getProductMovementsByProductName(searchQuery);
              }),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorConst.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          productIds.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: productIds.length,
                      itemBuilder: (context, index) {
                        final productId = productIds[index];

                        // Asegúrate de que existen entradas y/o salidas para este producto
                        if (productEntries[productId]!.isEmpty &&
                            productExits[productId]!.isEmpty) {
                          return Container(); // Devuelve un contenedor vacío en este caso
                        }

                        final productName =
                            productEntries[productId]![0].stock.producto.nombre;
                        final imageUrl =
                            productEntries[productId]![0].stock.producto.img;

                        int totalEntryBoxes = productEntries[productId]
                                ?.where((entry) =>
                                    entry.verificacion == 'VERIFICADO')
                                .fold(
                                    0,
                                    (sum, entry) =>
                                        sum! + entry.cantidadCajas) ??
                            0;
                        int totalEntryPieces = productEntries[productId]
                                ?.where((entry) =>
                                    entry.verificacion == 'VERIFICADO')
                                .fold(
                                    0,
                                    (sum, entry) =>
                                        sum! + entry.cantidadPiezas) ??
                            0;

                        int totalExitBoxes = productExits[productId]
                                ?.where(
                                    (exit) => exit.verificacion == 'VERIFICADO')
                                .fold(0,
                                    (sum, exit) => sum! + exit.cantidadCajas) ??
                            0;
                        int totalExitPieces = productExits[productId]
                                ?.where(
                                    (exit) => exit.verificacion == 'VERIFICADO')
                                .fold(
                                    0,
                                    (sum, exit) =>
                                        sum! + exit.cantidadPiezas) ??
                            0;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovementDetailPage(
                                          productId: productId,
                                          image: imageUrl,
                                          name: productName,
                                          totalExitBoxes:
                                              totalExitBoxes.toString(),
                                          totalExitPieces:
                                              totalExitPieces.toString(),
                                          totalEntryBoxes:
                                              totalEntryBoxes.toString(),
                                          totalEntryPieces:
                                              totalEntryPieces.toString(),
                                          productEntries: productEntries,
                                          productExits: productExits,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 2),
                                  color: Colors.black.withOpacity(.12),
                                  blurRadius: 16,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageUrl.toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black.withOpacity(.3),
                                                Colors.black.withOpacity(.1),
                                              ],
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            )),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  productName,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const Text(
                                                      'Entradas : ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      totalEntryBoxes
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ' cajas',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  ' $totalEntryPieces piezas',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Salidas : ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      ' $totalExitBoxes',
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Text(
                                                      ' cajas',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '$totalExitPieces piezas',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            width: MediaQuery.of(context).size.width - 32,
                            height: MediaQuery.of(context).size.height / 3,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }),
                ),
          // MovementsViewTest(),
        ],
      ),
    );
  }
}
