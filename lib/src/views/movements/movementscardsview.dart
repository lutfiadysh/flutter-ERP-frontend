import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MovementsCardsView extends StatefulWidget {
  const MovementsCardsView({super.key});

  @override
  _MovementsCardsView createState() => _MovementsCardsView();
}

class _MovementsCardsView extends State<MovementsCardsView> {
  Future<void>? loadDataFuture;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    loadDataFuture = Provider.of<MovementsProvider>(context, listen: false)
        .getProductEntriesAndExits();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth >
        600; // Define un ancho mínimo para considerar la plataforma como web

    return FutureBuilder(
      future: loadDataFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Error handling
          return const Center(child: Text('Ha ocurrido un error!'));
        } else {
          final movementsProvider = Provider.of<MovementsProvider>(context);
          final productEntries = movementsProvider.productEntries;
          final productExits = movementsProvider.productExits;

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isWeb ? screenWidth * 0.45 : screenWidth,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: productEntries.length,
              itemBuilder: (context, index) {
                final productId = productEntries.keys.elementAt(index);
                final productName =
                    productEntries[productId]![0].stock.producto.nombre;
                final imageUrl =
                    productEntries[productId]![0].stock.producto.img;

                int totalEntryBoxes = productEntries[productId]
                        ?.where((entry) => entry.verificacion == 'VERIFICADO')
                        .fold(0, (sum, entry) => sum! + entry.cantidadCajas) ??
                    0;
                int totalEntryPieces = productEntries[productId]
                        ?.where((entry) => entry.verificacion == 'VERIFICADO')
                        .fold(0, (sum, entry) => sum! + entry.cantidadPiezas) ??
                    0;

                int totalExitBoxes = productExits[productId]
                        ?.where((exit) => exit.verificacion == 'VERIFICADO')
                        .fold(0, (sum, exit) => sum! + exit.cantidadCajas) ??
                    0;
                int totalExitPieces = productExits[productId]
                        ?.where((exit) => exit.verificacion == 'VERIFICADO')
                        .fold(0, (sum, exit) => sum! + exit.cantidadPiezas) ??
                    0;

                return Card(
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagen del producto
                          imageUrl != null
                              ? Container(
                                  width: 120, // define el ancho
                                  height: 120, // define el alto
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.image_not_supported,
                                  size: 120),

                          // Espaciado entre la imagen y el texto
                          const SizedBox(width: 16),

                          // Información del producto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Entradas: $totalEntryBoxes cajas, $totalEntryPieces piezas',
                                ),
                                Text(
                                  'Salidas: $totalExitBoxes cajas, $totalExitPieces piezas',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            ExpansionTile(
                              title: const Text('Detalles de las Entradas:'),
                              children: productEntries[productId]?.isEmpty ??
                                      true
                                  ? [const Text('Sin movimientos')]
                                  : [
                                      Table(
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
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
                                          1: FlexColumnWidth(1),
                                          2: FlexColumnWidth(1),
                                          3: FlexColumnWidth(1),
                                        },
                                        children: _movementsToTableRows(
                                            productEntries[productId]!
                                                .where((entry) =>
                                                    entry.verificacion ==
                                                    'VERIFICADO')
                                                .toList()),
                                      ),
                                    ],
                            ),
                            const SizedBox(height: 8),
                            ExpansionTile(
                              title: const Text('Detalles de las Salidas:'),
                              children: productExits[productId]?.isEmpty ?? true
                                  ? [const Text('Sin movimientos')]
                                  : [
                                      Table(
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
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
                                          1: FlexColumnWidth(1),
                                          2: FlexColumnWidth(1),
                                          3: FlexColumnWidth(1),
                                        },
                                        children: _movementsToTableRows(
                                            productExits[productId]!
                                                .where((exit) =>
                                                    exit.verificacion ==
                                                    'VERIFICADO')
                                                .toList()),
                                      ),
                                    ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildDetailsTable(String title, List<Movimiento> movements) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      children: movements.isEmpty
          ? [const Text('Sin movimientos')]
          : [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: _movementsToTableRows(movements),
              ),
            ],
    );
  }

  List<TableRow> _movementsToTableRows(List<Movimiento> movements) {
    return [
      _header(),
      ...movements.asMap().entries.map<TableRow>((entry) {
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat('dd MMMM yyyy', 'es')
                      .format(entry.value.fecha.toLocal()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.value.stock.sucursal.definicion),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.value.cantidadCajas.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.value.cantidadPiezas.toString()),
              ),
            ),
          ],
        );
      }).toList(),
    ];
  }

  TableRow _header() {
    return const TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Fecha',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Sucursal',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Cajas',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Piezas',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
