import 'package:admin_dashboard/proy/databases/categories_datasource.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/src/views/categories/categoryview_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableCategories extends StatefulWidget {
  const TableCategories({super.key});

  @override
  State<TableCategories> createState() => _TableCategoriesState();
}

class _TableCategoriesState extends State<TableCategories> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const PageScrollPhysics(),
          shrinkWrap: true,
          children: [
            PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('Categoría')),
                DataColumn(label: Text('Material')),
                DataColumn(label: Text('Acabado')),
                DataColumn(label: Text('Dimensiones')),
                DataColumn(label: Text('Unidades/Caja')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS(categorias, context),
              header: const Text('Categorías'),
              onRowsPerPageChanged: ((value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              }),
              rowsPerPage: _rowsPerPage,
              actions: [
                ElevatedButton.icon(
                    onPressed: () => _showCreateCategoryDialog(context),
                    label: const Text('Crear'),
                    icon: const Icon(Icons.add_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showCreateCategoryDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text("Crear categoria"),
        content: SingleChildScrollView(child: CategoryViewTest()),
      ),
    );
  }
}
