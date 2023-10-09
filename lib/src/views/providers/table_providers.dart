import 'package:admin_dashboard/proy/databases/providers_datasource.dart';
import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/src/views/providers/providerview_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableProviders extends StatefulWidget {
  const TableProviders({super.key});

  @override
  State<TableProviders> createState() => _TableProvidersState();
}

class _TableProvidersState extends State<TableProviders> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProvidersProvider>(context, listen: false).getProviders();
  }

  @override
  Widget build(BuildContext context) {
    final proveedores = Provider.of<ProvidersProvider>(context).proveedores;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          physics: const PageScrollPhysics(),
          shrinkWrap: true,
          children: [
            PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Teléfono')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Acciones')),
              ],
              source: ProvidersDTS(proveedores, context),
              header: const Text('Proveedores'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () => _showCreateProviderDialog(context),
                    label: const Text('Crear'),
                    icon: const Icon(Icons.add_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showCreateProviderDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text("Añadir proveedor"),
        content: SingleChildScrollView(child: ProviderViewTest()),
      ),
    );
  }
}
