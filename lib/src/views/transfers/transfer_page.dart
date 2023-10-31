import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/models/transfer.dart';
import 'package:admin_dashboard/proy/providers/transfers_provider.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/transfers/card_transfers.dart';
import 'package:admin_dashboard/src/views/transfers/table_transfer.dart';
import 'package:admin_dashboard/src/views/transfers/transfer_create_list_page.dart';
import 'package:admin_dashboard/src/views/transfers/transfer_create_view_test.dart';
import 'package:admin_dashboard/src/views/transfers/transfers_view_test.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final List<Note> _notes = [];
  @override
  void initState() {
    super.initState();

    Provider.of<TransfersProvider>(context, listen: false).getTransfers();
  }

  @override
  Widget build(BuildContext context) {
    final traspasos = Provider.of<TransfersProvider>(context).traspasos;
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
          Strings.transfers,
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
                      builder: (context) => TransferCreateListPage()));
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
      body: traspasos.isNotEmpty
          ? Column(
              children: [
                Column(
                  children: traspasos.map((e) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.usuario.nombre,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                formatDuration(e.fecha),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(productsList(e.entradas)),
                          Text(totalCajasPiezas(e.entradas)),
                          // Expanded(
                          //   child: ListView.builder(
                          //       itemCount: e.salidas.length,
                          //       itemBuilder: (context, index) {
                          //         var item = e.salidas[index];
                          //         var itemEntradas = e.entradas[index];
                          //         return Row(
                          //           children: [
                          //             Text(item.stock.producto.nombre),
                          //             const Icon(
                          //               Icons.arrow_forward,
                          //               color: Colors.red,
                          //             ),
                          //             Text(itemEntradas.stock.producto.nombre),
                          //           ],
                          //         );
                          //       }),
                          // ),
                          FxBox.h16,
                          Row(
                            children: [
                              Column(
                                  children: e.salidas.asMap().entries.map((x) {
                                var index = x.key;
                                var valentra = e.entradas[index];
                                var value = x.value;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(value.stock.producto.nombre),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                    ),
                                    Text(valentra.stock.producto.nombre),
                                  ],
                                );
                              }).toList()),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
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

  String formatDuration(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = difference.inDays ~/ 365;
      return '$years año${years > 1 ? 's' : ''} atrás';
    } else if (difference.inDays > 30) {
      final months = difference.inDays ~/ 30;
      return '$months mes${months > 1 ? 'es' : ''} atrás';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} día${difference.inDays > 1 ? 's' : ''} atrás';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hora${difference.inHours > 1 ? 's' : ''} atrás';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''} atrás';
    } else {
      return 'Hace unos segundos';
    }
  }

  String productsList(List<Movements> movimientos) {
    final productNames =
        movimientos.map((mov) => mov.stock.producto.nombre).toSet().toList();
    return productNames.join(', ');
  }

  String totalCajasPiezas(List<Movements> movimientos) {
    int cajas = 0;
    int piezas = 0;

    for (var mov in movimientos) {
      cajas += mov.cantidadCajas;
      piezas += mov.cantidadPiezas;
    }

    return '$cajas Cajas, $piezas Piezas';
  }
}
