import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/categories/categoryview_test.dart';
import 'package:admin_dashboard/src/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow? getRow(int index) {
    final categoria = categorias[index];

    // ignore: todo
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.nombre)),
      DataCell(Text(categoria.material)),
      DataCell(Text(categoria.acabado)),
      DataCell(Text(categoria.dimensiones)),
      DataCell(Text(categoria.unidadesPorCaja.toString())),
      DataCell(Text(categoria.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                shoModelUser(
                    'Crear usuario',
                    CategoryViewTest(categoria: categoria),
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
                title: const Text('¿Esta seguro de borrar la categoría?'),
                content: Text('Borrar definitivamente ${categoria.nombre}?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                  TextButton(
                      onPressed: () async {
                        await Provider.of<CategoriesProvider>(context,
                                listen: false)
                            .deleteCategory(categoria.id);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: const Text('Si, borrar')),
                ],
              );
              showDialog(
                context: context,
                builder: (_) => dialog,
              );
            },
            icon:
                Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.5)),
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
  int get rowCount => categorias.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
