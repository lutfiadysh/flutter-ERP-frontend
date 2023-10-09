import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/providers/providerview_test.dart';
import 'package:admin_dashboard/src/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

import '../models/provider.dart';

class ProvidersDTS extends DataTableSource {
  final List<Proveedor> proveedores;
  final BuildContext context;

  ProvidersDTS(this.proveedores, this.context);

  @override
  DataRow? getRow(int index) {
    final proveedor = proveedores[index];

    // ignore: todo
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(proveedor.nombre)),
      DataCell(Text(proveedor.telefono ?? 'No hay telefono')),
      DataCell(Text(proveedor.correo ?? 'No hay email')),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                shoModelUser(
                    'Crear usuario',
                    ProviderViewTest(proveedor: proveedor),
                    [
                      FxButton(
                        onPressed: () => Navigator.pop(context),
                        text: Strings.close,
                        buttonType: ButtonType.secondary,
                      ),
                    ],
                    ModalType.large);
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
            onPressed: () {
              final dialog = AlertDialog(
                title: const Text('¿Esta seguro de borrar el proveedor?'),
                content: Text('Borrar definitivamente ${proveedor.nombre}?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                  TextButton(
                      onPressed: () async {
                        await Provider.of<ProvidersProvider>(context,
                                listen: false)
                            .deleteProvider(proveedor.id);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Si')),
                ],
              );
              showDialog(context: context, builder: (_) => dialog);
            },
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      )),
    ]);
  }

  Future<Object?> shoModelUser(String title, Widget content,
      List<Widget> actions, ModalType? modalType) {
    return FxModal.showModel(
      context: context,
      title: title,
      content: SelectionArea(child: content),
      trailingIcon: const SvgIcon(icon: IconlyBroken.closeSquare),
      actions: actions,
      modelType: modalType,
    );
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => proveedores.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
