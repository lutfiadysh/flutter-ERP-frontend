import 'package:admin_dashboard/proy/models/dashboard.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/text.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';

class Transaction extends StatefulWidget {
  final Dashboard dashboard;
  const Transaction({Key? key, required this.dashboard}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late List<Movimiento> movimientosRecientes;

  @override
  void initState() {
    super.initState();
    movimientosRecientes = widget.dashboard.movimientosRecientes;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstText.lightText(
              text: Strings.latestTransaction,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h10,
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
              child: DataTable3(
                showCheckboxColumn: false,
                showBottomBorder: true,
                columnSpacing: 20.0,
                minWidth: 728.0,
                dataRowHeight: 56.0,
                headingRowHeight: 64.0,
                border: TableBorder(
                  bottom: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade200,
                  ),
                  horizontalInside: BorderSide(
                    width: 1,
                    color: isDark
                        ? ColorConst.white.withOpacity(0.25)
                        : Colors.grey.shade50,
                  ),
                ),
                columns: [
                  DataColumn2(
                    label: _tableHeader('Usuario'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader('Producto'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('Tipo de movimiento'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('Fecha de Movimiento'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: _tableHeader('Cantidad de cajas'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('Cantidad de piezas'),
                    size: ColumnSize.M,
                  ),
                  DataColumn2(
                    label: _tableHeader('Estado de verificacion'),
                    size: ColumnSize.L,
                  ),
                ],
                rows: movimientosRecientes.map((movimiento) {
                  return DataRow(
                    onSelectChanged: (value) {},
                    cells: [
                      // ID del movimiento
                      DataCell(_tableRowImage(movimiento.usuario.nombre,
                          movimiento.usuario.img)), // Nombre del usuario
                      DataCell(_tableHeader(movimiento.stock.producto.nombre)),
                      DataCell(_tableHeader(
                          movimiento.movimiento)), // Nombre del producto
                      DataCell(_tableHeader(_formatDate(
                          movimiento.fecha))), // Fecha del movimiento
                      DataCell(
                          _tableHeader(movimiento.cantidadCajas.toString())),
                      DataCell(_tableHeader(movimiento.cantidadPiezas
                          .toString())), // Cantidad del movimiento
                      DataCell(_statusBox(movimiento.verificacion)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Define el idioma local a español
    var outputFormat = DateFormat("EEEE d 'de' MMMM", 'es_ES');
    return outputFormat.format(date);
  }

  Widget _tableHeader(String text) {
    return ConstText.lightText(
      text: text,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _tableRowImage(String text, String? img) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 15,
          backgroundImage: img != null ? NetworkImage(img) : null,
          // Puedes agregar una imagen predeterminada si img es null
          child: img == null ? const Icon(Icons.person) : null,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Color? _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'VERIFICADO':
        return Colors
            .green.shade400; // Color agradable al ojo para estado "VERIFICADO"
      case 'PENDIENTE':
        return Colors
            .yellow.shade600; // Color agradable al ojo para estado "PENDIENTE"
      case 'ERROR':
        return Colors
            .red.shade400; // Color agradable al ojo para estado "ERROR"
      default:
        return Colors.grey; // Color por defecto
    }
  }

  Widget _statusBox(String text) {
    Color? color = _getStatusColor(text);
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  Widget _editButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.mode_edit_rounded),
    );
  }
}
