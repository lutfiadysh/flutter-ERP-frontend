import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovementsDTS extends DataTableSource {
  final List<Movimiento> movimientos;
  final BuildContext context;

  MovementsDTS(this.movimientos, this.context);
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat hourFormat = DateFormat("HH:mm");
  @override
  DataRow? getRow(int index) {
    final movimiento = movimientos[index];

    // ignore: todo
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(movimiento.movimiento)),
      DataCell(Text(movimiento.stock.producto.nombre)),
      DataCell(Text(movimiento.stock.sucursal.definicion)),
      DataCell(Text(movimiento.cantidadCajas.toString())),
      DataCell(Text(movimiento.cantidadPiezas.toString())),
      DataCell(Text(dateFormat.format(movimiento.fecha.toLocal()))),
      DataCell(Text(hourFormat.format(movimiento.fecha.toLocal()))),
      DataCell(Text(movimiento.usuario.nombre)),
    ]);
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => movimientos.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
