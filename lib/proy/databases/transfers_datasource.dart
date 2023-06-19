import 'package:admin_dashboard/proy/models/transfer.dart';
import 'package:flutter/material.dart';

class TransfersDTS extends DataTableSource {
  final List<Traspaso> traspasos;
  final BuildContext context;

  TransfersDTS(this.traspasos, this.context);

  @override
  DataRow? getRow(int index) {
    final traspaso = traspasos[index];

    // ignore: todo
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(traspaso.id)),
      DataCell(Text(traspaso.usuario.nombre)),
    ]);
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => traspasos.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
