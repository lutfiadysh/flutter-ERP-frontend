import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/movements/card_movements.dart';
import 'package:admin_dashboard/src/views/movements/card_ordersmovements.dart';
import 'package:admin_dashboard/src/views/movements/card_salemovements.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../proy/providers/orders_provider.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  int currentIndex = 0;
  String selectedTab = 'Movimientos';
  @override
  void initState() {
    super.initState();

    Provider.of<MovementsProvider>(context, listen: false).getMovements();
  }

  @override
  Widget build(BuildContext context) {
    final pedidtos = Provider.of<OrdersProvider>(context).pedidos;
    final ventas = Provider.of<SalesProvider>(context).ventas;

    final movimientos = Provider.of<MovementsProvider>(context).movimientos;
    final size = MediaQuery.of(context).size.height;

    List<Movimiento> filterMovementsByType(String type,
        {String? verificationStatus}) {
      return movimientos
          .where((movimiento) =>
              movimiento.movimiento == type &&
              (verificationStatus == null ||
                  movimiento.verificacion == verificationStatus))
          .toList();
    }

    List<Movimiento> filterMovementsByVerificationStatus(
        String verificationStatus) {
      return movimientos
          .where((movimiento) => movimiento.verificacion == verificationStatus)
          .toList();
    }

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
          titleSpacing: 0,
          centerTitle: false,
          title: const Text(
            Strings.verifications,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: movimientos.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: statusList.map((e) {
                          var index = statusList.indexOf(e);
                          // setState(() {

                          // });
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTab = e;
                                currentIndex = index;
                              });
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedTab == e
                                      ? ColorConst.blue.withOpacity(.2)
                                      : null,
                                  border: Border.all(
                                    color: selectedTab == e
                                        ? ColorConst.blue
                                        : Colors.grey,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    color: selectedTab == e
                                        ? ColorConst.blue
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          );
                        }).toList(),
                      ),
                    ),
                    FxBox.h12,
                    IndexedStack(
                      index: currentIndex,
                      children: [
                        buildList(
                            filterMovementsByVerificationStatus('EN ESPERA'),
                            showMovementType: true),
                        buildList(filterMovementsByType('ENTRADA',
                            verificationStatus: 'EN ESPERA')),
                        buildList(filterMovementsByType('SALIDA',
                            verificationStatus: 'EN ESPERA')),
                        buildList(
                            filterMovementsByVerificationStatus('VERIFICADO')),
                        CardSalesMovements(
                          ventas: ventas,
                        ),
                        CardOrdersMovements(
                          pedidos: pedidtos,
                        ),
                      ],
                    )
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
                      height: MediaQuery.of(context).size.height / 4,
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

  List<String> statusList = [
    'Movimientos',
    'Entradas',
    'Salidas',
    'Verificados',
    'Ventas',
    'Pedidos'
  ];

  Widget buildList(List<Movimiento> filteredMovements,
      {bool showMovementType = false}) {
    return Column(
      children: filteredMovements.map((movimiento) {
        return GestureDetector(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     // return MovementDetailsDialog(movimiento: movimiento);
            //   },
            // );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(
                        movimiento.stock.producto.img.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerificationBadge(
                        verificationStatus: movimiento.verificacion,
                      ),
                    ],
                  ),
                ),

                // const SizedBox(width: 16),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movimiento.stock.producto.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (showMovementType)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Movimiento: ${movimiento.movimiento}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      Text(
                        'Sucursal: ${movimiento.stock.sucursal.municipio}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Cantidad de cajas: ${movimiento.cantidadCajas}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Cantidad de piezas: ${movimiento.cantidadPiezas}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Creado: ${timeAgo(movimiento.fecha)}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
    return ListView.builder(
      itemCount: filteredMovements.length,
      itemBuilder: (context, index) {
        final movimiento = filteredMovements[index];

        return GestureDetector(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     // return MovementDetailsDialog(movimiento: movimiento);
            //   },
            // );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      VerificationImage(
                        imageUrl: movimiento.stock.producto.img,
                      ),
                      const SizedBox(height: 8),
                      VerificationBadge(
                        verificationStatus: movimiento.verificacion,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movimiento.stock.producto.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        if (showMovementType)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Movimiento: ${movimiento.movimiento}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        Text(
                          'Sucursal: ${movimiento.stock.sucursal.municipio}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cantidad de cajas: ${movimiento.cantidadCajas}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cantidad de piezas: ${movimiento.cantidadPiezas}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Creado: ${timeAgo(movimiento.fecha)}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays} días atrás';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} horas atrás';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutos atrás';
    } else {
      return 'hace un momento';
    }
  }
}
