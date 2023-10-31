import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/views/movements/create_entries_page.dart';
import 'package:admin_dashboard/src/views/movements/create_exits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';

class MovementDetailPage extends StatefulWidget {
  final String productId;
  final String? image;
  final String name;
  final String totalEntryBoxes;
  final String totalEntryPieces;
  final String totalExitBoxes;
  final String totalExitPieces;
  final Map<String, List<Movimiento>> productEntries;
  final Map<String, List<Movimiento>> productExits;
  const MovementDetailPage({
    super.key,
    required this.productId,
    required this.image,
    required this.name,
    required this.totalEntryBoxes,
    required this.totalEntryPieces,
    required this.totalExitBoxes,
    required this.totalExitPieces,
    required this.productEntries,
    required this.productExits,
  });

  @override
  State<MovementDetailPage> createState() => _MovementDetailPageState();
}

class _MovementDetailPageState extends State<MovementDetailPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.image.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 14,
                        left: 16,
                        right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateEntriesPage(
                                            productId: widget.productId)));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  children: [
                                    Text('Crear entrada '),
                                    Icon(
                                      Icons.add,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FxBox.h12,
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateExistsPage(
                                            productId: widget.productId)));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  children: [
                                    Text('Crear salida'),
                                    Icon(
                                      Icons.add,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3.5),
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 1.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        FxBox.h16,
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Entradas',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.totalEntryBoxes.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          ' cajas',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.totalEntryPieces,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          ' piezas',
                                          style: TextStyle(
                                            color: Colors.black,
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
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Salidas',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.totalExitBoxes.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          ' cajas',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.totalExitPieces,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          ' piezas',
                                          style: TextStyle(
                                            color: Colors.black,
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
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              pageIndex = 0;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Entradas',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (pageIndex == 0)
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width / 12,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: ColorConst.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        FxBox.w24,
                        InkWell(
                          onTap: () {
                            setState(() {
                              pageIndex = 1;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Salidas',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (pageIndex == 1)
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width / 12,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: ColorConst.blue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxBox.h16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pageIndex == 0
                        ? widget.productEntries[widget.productId]!.map((e) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat('dd MMMM yyyy', 'es')
                                                .format(e.fecha.toLocal()),
                                          ),
                                          Text(e.stock.sucursal.municipio),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              '${e.cantidadCajas.toString()} Cajas'),
                                          Text(
                                              '${e.cantidadPiezas.toString()} Piezas')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }).toList()
                        : widget.productExits[widget.productId]!.map((e) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat('dd MMMM yyyy', 'es')
                                                .format(e.fecha.toLocal()),
                                          ),
                                          Text(e.stock.sucursal.municipio),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              '${e.cantidadCajas.toString()} Cajas'),
                                          Text(
                                              '${e.cantidadPiezas.toString()} Piezas')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
