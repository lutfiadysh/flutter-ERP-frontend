import 'package:admin_dashboard/proy/models/input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsDTS extends DataTableSource {
  final List<Entrada> entradas;
  final BuildContext context;

  InputsDTS(this.entradas, this.context);
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat hourFormat = DateFormat("HH:mm");
  @override
  DataRow? getRow(int index) {
    final entrada = entradas[index];

    // ignore: todo
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(entrada.stock.producto.nombre)),
      DataCell(Text(entrada.stock.sucursal.municipio)),
      DataCell(Text(entrada.cantidadCajas.toString())),
      DataCell(Text(entrada.cantidadPiezas.toString())),
      DataCell(Text(dateFormat.format(entrada.fecha.toLocal()))),
      DataCell(Text(hourFormat.format(entrada.fecha.toLocal()))),
      DataCell(Text(entrada.usuario.nombre)),
    ]);
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => entradas.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
