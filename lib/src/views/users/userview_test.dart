import 'package:admin_dashboard/proy/models/user.dart';
import 'package:admin_dashboard/proy/providers/user_form_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserViewTest extends StatefulWidget {
  final String uid;

  const UserViewTest({Key? key, required this.uid}) : super(key: key);

  @override
  _UserViewTestState createState() => _UserViewTestState();
}

class _UserViewTestState extends State<UserViewTest> {
  Usuario? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
      if (mounted) {
        setState(() {
          user = userDB;
          userFormProvider.user = userDB;
          userFormProvider.formKey = GlobalKey<FormState>();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(child: CircularProgressIndicator());
    }

    return UserForm(user: user);
  }
}

class UserForm extends StatelessWidget {
  final Usuario? user;

  const UserForm({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);

    return Form(
      key: userFormProvider.formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AvatarContainer(imageUrl: user!.img),
            SizedBox(height: 20),
            TextFormField(
              initialValue: user!.nombre,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese un nombre.';
                }
                if (value.length < 2) {
                  return 'El nombre debe de ser de dos letras como mínimo.';
                }
                return null;
              },
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: user!.correo,
              decoration: InputDecoration(
                labelText: 'Correo',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) {
                  return 'Email no válido';
                }
                return null;
              },
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                final saved = await userFormProvider.updateUser();
                if (saved) {
                  Provider.of<UsersProvider>(context, listen: false)
                      .refreshUser(user!);
                  Navigator.pop(context);
                  NotificationsService.showSnackbar('Usuario actualizado');
                } else {
                  NotificationsService.showSnackbar('No se pudo guardar');
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarContainer extends StatelessWidget {
  final String? imageUrl;

  const AvatarContainer({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    final image = imageUrl != null
        ? Image.network(imageUrl!)
        : Image.asset('assets/no-image.jpg');

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 80,
        backgroundImage: image.image as ImageProvider<Object>?,
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'jpeg'],
              );

              if (result != null) {
                PlatformFile file = result.files.first;
                NotificationsService.showBusyIndicator(context);

                final resp = await userFormProvider.uploadImage(
                  '/uploads/usuarios/${user.uid}',
                  file.bytes!,
                );

                usersProvider.refreshUser(resp);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );
  }
}
