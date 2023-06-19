import 'package:admin_dashboard/proy/models/output.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OutputsDTS extends DataTableSource {
  final List<Salida> salidas;
  final BuildContext context;

  OutputsDTS(this.salidas, this.context);
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat hourFormat = DateFormat("HH:mm");
  @override
  DataRow? getRow(int index) {
    final salida = salidas[index];

    // ignore: todo
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(salida.stock.producto.nombre)),
      DataCell(Text(salida.cantidadCajas.toString())),
      DataCell(Text(dateFormat.format(salida.fecha.toLocal()))),
      DataCell(Text(hourFormat.format(salida.fecha.toLocal()))),
      DataCell(Text(salida.usuario.nombre)),
    ]);
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => salidas.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
