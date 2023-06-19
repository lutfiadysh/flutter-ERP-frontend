import 'package:admin_dashboard/proy/models/user.dart';
import 'package:admin_dashboard/proy/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UsersDataSource extends DataTableSource {
  final List<Usuario> users;
  UsersDataSource(this.users);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    final image = (user.img == null)
        ? CircleAvatar(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: const Image(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/no-image.jpg'),
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.white,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loader.gif',
                image: user.img!,
                fit: BoxFit.fitWidth,
              ),
            ),
          );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(child: image)),
      DataCell(Text(user.nombre)),
      DataCell(Text(user.correo)),
      DataCell(Text(user.uid)),
      DataCell(IconButton(
          onPressed: () {
            NavigationService.replaceTo('/dashboard/users/${user.uid}');
          },
          icon: const Icon(Icons.edit_outlined)))
    ]);
  }

  @override
  // ignore: todo
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // ignore: todo
  // TODO: implement rowCount
  int get rowCount => users.length;

  @override
  // ignore: todo
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
