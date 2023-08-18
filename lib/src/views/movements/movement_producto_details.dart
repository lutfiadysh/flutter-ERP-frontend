import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, List<Movimiento>> productMovements;
  final String productId;
  final String title;

  const ProductDetail({
    Key? key,
    required this.productMovements,
    required this.productId,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: productMovements[productId]?.isEmpty ?? true
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
                  3: FlexColumnWidth(1),
                },
                children: _movementsToTableRows(
                  productMovements[productId]!.toList(),
                ),
              ),
            ],
    );
  }

  List<TableRow> _movementsToTableRows(List<Movimiento> movements) {
    return [
      _header(),
      ...movements.map<TableRow>((entry) {
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  DateFormat('dd MMMM yyyy', 'es')
                      .format(entry.fecha.toLocal()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.stock.sucursal.definicion),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.cantidadCajas.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(entry.cantidadPiezas.toString()),
              ),
            ),
          ],
        );
      }).toList(),
    ];
  }
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
