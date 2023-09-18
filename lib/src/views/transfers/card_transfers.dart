import 'dart:async';

import 'package:admin_dashboard/proy/models/transfer.dart';
import 'package:admin_dashboard/proy/providers/transfers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTransfers extends StatefulWidget {
  final List<Traspaso> traspasos;

  const CardTransfers({
    Key? key,
    required this.traspasos,
  }) : super(key: key);

  @override
  State<CardTransfers> createState() => _TransfersState();
}

class _TransfersState extends State<CardTransfers> {
  Future<void>? _loadTransfers;

  @override
  void initState() {
    super.initState();
    _loadTransfers = _fetchTransfers();
  }

  Future<void> _fetchTransfers() async {
    return Provider.of<TransfersProvider>(context, listen: false)
        .getTransfers()
        .timeout(const Duration(seconds: 5), onTimeout: () {
      // Si se supera el tiempo de espera, se lanza una excepción.
      throw TimeoutException('Tiempo de espera superado');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadTransfers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error al cargar los traspasos o tiempo de espera superado.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          final traspasos = Provider.of<TransfersProvider>(context).traspasos;

          return SizedBox(
            width:
                double.infinity, // Asegura que ocupe todo el ancho disponible
            child: SingleChildScrollView(
              child: traspasos.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alineación desde el inicio
                      children: traspasos
                          .map((traspaso) => TraspasoCard(traspaso: traspaso))
                          .toList(),
                    )
                  : const Center(
                      child: Text(
                        'No existen traspasos, añade uno',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          );
        }
      },
    );
  }
}

class TraspasoCard extends StatelessWidget {
  final Traspaso traspaso;

  TraspasoCard({required this.traspaso});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatDuration(traspaso.fecha),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Creado por: ${traspaso.usuario.nombre}'),
            Text('Productos: ${productsList(traspaso.entradas)}'),
            Text('Total: ${totalCajasPiezas(traspaso.entradas)}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Detalles:'),
                const SizedBox(height: 8),
                const Text('ORIGEN:'),
                Table(
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment.middle, // Agregar esta línea
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    const TableRow(children: [
                      Text(''),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Producto'),
                      ),
                      Text('Cajas'),
                      Text('Piezas'),
                      Text('Sucursal'),
                    ]),
                    ...entradasToTableRows(traspaso.entradas),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('DESTINO:'),
                Table(
                  defaultVerticalAlignment:
                      TableCellVerticalAlignment.middle, // Agregar esta línea

                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    const TableRow(children: [
                      Text(''),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Producto'),
                      ),
                      Text('Cajas'),
                      Text('Piezas'),
                      Text('Sucursal'),
                    ]),
                    ...salidasToTableRows(traspaso.salidas),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<TableRow> entradasToTableRows(List<Movements> movimientos) {
  return movimientos.map<TableRow>((movimiento) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ProductImageCircle(
          imageUrl: movimiento.stock.producto.img ??
              const AssetImage('assets/no-image.jpg'),
          verification: movimiento.verificacion,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(movimiento.stock.producto.nombre),
      ),
      Text('${movimiento.cantidadCajas}'),
      Text('${movimiento.cantidadPiezas}'),
      Text(movimiento.stock.sucursal.municipio),
    ]);
  }).toList();
}

List<TableRow> salidasToTableRows(List<Movements> movimientos) {
  return movimientos.map<TableRow>((movimiento) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ProductImageCircle(
          imageUrl: movimiento.stock.producto.img ??
              const AssetImage('assets/no-image.jpg'),
          verification: movimiento.verificacion,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(movimiento.stock.producto.nombre),
      ),
      Text('${movimiento.cantidadCajas}'),
      Text('${movimiento.cantidadPiezas}'),
      Text(movimiento.stock.sucursal.municipio),
    ]);
  }).toList();
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

class ProductImageCircle extends StatelessWidget {
  final dynamic imageUrl; // Change the type from String? to dynamic
  final String verification;

  ProductImageCircle({required this.imageUrl, required this.verification});

  Color get borderColor {
    switch (verification) {
      case 'VERIFICADO':
        return Colors.green;
      case 'EN ESPERA':
        return Colors.yellow;
      case 'ERROR':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: imageUrl is String
            ? NetworkImage(imageUrl)
            : imageUrl as ImageProvider<Object>?,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
