import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/models/user.dart';
import 'package:admin_dashboard/proy/providers/user_form_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class UserViewTest extends StatefulWidget {
  final String uid;

  const UserViewTest({Key? key, required this.uid}) : super(key: key);

  @override
  _UserViewTestState createState() => _UserViewTestState();
}

class _UserViewTestState extends State<UserViewTest> {
  late Future<Usuario?> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = Provider.of<UsersProvider>(context, listen: false)
        .getUserById(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Usuario?>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return const Center(child: CircularProgressIndicator());
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        if (snapshot.data == null) return const Text('Usuario no encontrado');

        final user = snapshot.data;
        final userFormProvider =
            Provider.of<UserFormProvider>(context, listen: false);
        userFormProvider.user = user;
        userFormProvider.formKey = GlobalKey<FormState>();
        return UserForm(user: user);
      },
    );
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AvatarContainer(imageUrl: user?.img),
            SizedBox(height: 20),
            CustomField(
              initialValue: user?.nombre,
              labelText: 'Nombre',
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Ingrese un nombre.'
                  : (value.length < 2)
                      ? 'El nombre debe de ser de dos letras como mínimo.'
                      : null,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
            ),
            SizedBox(height: 20),
            CustomField(
              initialValue: user?.correo,
              labelText: 'Correo',
              validator: (value) => !EmailValidator.validate(value ?? '')
                  ? 'Email no válido'
                  : null,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
            ),
            SizedBox(height: 20),
            SaveButton(user: user),
          ],
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final String? initialValue, labelText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const CustomField(
      {Key? key,
      this.initialValue,
      required this.labelText,
      this.validator,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

class SaveButton extends StatelessWidget {
  final Usuario? user;

  const SaveButton({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    return ElevatedButton(
      onPressed: () async {
        final saved = await userFormProvider.updateUser();
        if (saved != null) {
          Provider.of<UsersProvider>(context, listen: false).refreshUser(saved);
          Navigator.pop(context);
          NotificationsService.showSnackbar('Usuario actualizado');
        } else {
          Navigator.pop(context);
          NotificationsService.showSnackbarError('No se pudo guardar');
        }
      },
      child: const Text('Guardar'),
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
    final user = userFormProvider.user;

    final image = imageUrl != null
        ? Image.network(imageUrl!)
        : Image.asset('assets/no-image.jpg');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 80,
        backgroundImage: image.image as ImageProvider<Object>?,
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'jpeg']);
              if (result != null) {
                final file = result.files.first;
                NotificationsService.showBusyIndicator(context);
                final resp = await userFormProvider.uploadImage(
                    '/uploads/usuarios/${user?.uid}', file.bytes!);
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
