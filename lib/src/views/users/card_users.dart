import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/proy/models/user.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/src/views/users/userview_test.dart';

class CardUsers extends StatefulWidget {
  final List<Usuario> usuarios;

  const CardUsers({Key? key, required this.usuarios}) : super(key: key);

  @override
  State<CardUsers> createState() => _CardUsersState();
}

class _CardUsersState extends State<CardUsers> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Decide el número de elementos de la cuadrícula en base al tamaño de la pantalla
    int gridCount = (screenWidth < 600) ? 1 : 2;
    // Ajusta según tus necesidades
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.usuarios.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2, // Ajusta esto según tus necesidades
      ),
      itemBuilder: (context, index) {
        final usuario = widget.usuarios[index];

        final image = (usuario.img == null)
            ? const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/no-image.jpg'),
              )
            : CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(usuario.img!),
              );

        return Dismissible(
          key: ValueKey(usuario.uid),
          background: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 50),
              child: const Icon(Icons.delete_outline_rounded)),
          onDismissed: (direction) {
            Provider.of<UsersProvider>(context, listen: false)
                .deleteUser(usuario.uid);
          },
          confirmDismiss: (direction) async {
            return await _showDeleteConfirmationDialog(context, usuario.nombre);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: InkWell(
              onTap: () {
                _showUserDetails(context, usuario.uid);
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 200), // Define a minimum height
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(16),
                      child: image,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              usuario.nombre,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Correo: ${usuario.correo}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Rol: ${usuario.rol}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Estado: ${usuario.estado ? 'Activo' : 'Inactivo'}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(
      BuildContext context, String userName) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¿Esta seguro de borrar el usuario?'),
          content: Text('Borrar definitivamente $userName?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Si, borrar'),
            ),
          ],
        );
      },
    );
  }

  void _showUserDetails(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalles del usuario'),
          content: SingleChildScrollView(
            child: UserViewTest(
              uid: userId,
            ),
          ),
        );
      },
    );
  }
}
