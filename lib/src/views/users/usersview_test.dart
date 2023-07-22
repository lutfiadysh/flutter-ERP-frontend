import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/src/views/users/registerusers_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_users.dart';

@RoutePage()
class UsersViewTest extends StatefulWidget {
  const UsersViewTest({Key? key}) : super(key: key);

  @override
  State<UsersViewTest> createState() => _UsersViewTestState();
}

class _UsersViewTestState extends State<UsersViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<UsersProvider>(context, listen: false).getPaginatedUsers();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsersProvider>(context).users;
    final size = MediaQuery.of(context).size.height;
    // Obtén el ancho de la pantalla actual
    double screenWidth = MediaQuery.of(context).size.width;

    // Decide si es móvil o web según el ancho de pantalla
    bool isMobile =
        screenWidth < 600; // Ajusta el valor 600 según tus necesidades

    return SizedBox(
      height: size - 75 - 95,
      child: Scaffold(
        appBar: AppBar(title: const Text("Usuarios")),
        body: CardUsers(usuarios: usuarios),
        floatingActionButton: isMobile
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  _showDialog(context);
                },
              )
            : FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                label: const Text('Crear usuario'),
                onPressed: () {
                  _showDialog(context);
                },
              ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        content: SingleChildScrollView(child: RegisterViewTest()),
        title: Text('Crear usuario'),
      ),
    );
  }
}
