import 'package:admin_dashboard/proy/databases/users_datasource.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Datatable extends StatefulWidget {
  const Datatable({super.key});

  @override
  State<Datatable> createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDataSource(usersProvider.users);

    return Card(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              PaginatedDataTable(
                
                header: Text('Usuarios'),
                sortAscending: usersProvider.ascending,
                sortColumnIndex: usersProvider.sortColumndIndex,
                columns: [
                  DataColumn(label: Text('Avatar')),
                  DataColumn(
                    label: const Text('Nombre'),
                    onSort: (columnIndex, _) {
                      usersProvider.sortColumndIndex = columnIndex;
                      usersProvider.sort<String>((user) => user.nombre);
                    },
                  ),
                  DataColumn(
                    label: const Text('Email'),
                    onSort: (columnIndex, _) {
                      usersProvider.sortColumndIndex = columnIndex;
                      usersProvider.sort<String>((user) => user.correo);
                    },
                  ),
                  DataColumn(label: Text('UID')),
                  DataColumn(label: Text('Acciones')),
                ],
                source: usersDataSource,
                onPageChanged: (value) {
                  print(value);
                },
              )
            ],
          )),
    );
  }
}
