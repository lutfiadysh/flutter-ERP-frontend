import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:admin_dashboard/proy/providers/branches_provider.dart';
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
    Provider.of<BranchesProvider>(context, listen: false).getBranches();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Usuario?>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
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

class UserForm extends StatefulWidget {
  final Usuario? user;

  const UserForm({Key? key, this.user}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String? role;
  Branch? branch;

  List<String> roleList = [
    "Vendedor",
    "Supervisor",
    "Administrador",
    "Inventarios"
  ];

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final sucursales = Provider.of<BranchesProvider>(context).branches;
    return Form(
      key: userFormProvider.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AvatarContainer(imageUrl: widget.user?.img),
            const SizedBox(height: 20),
            CustomField(
              initialValue: widget.user?.nombre,
              labelText: 'Nombre',
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Ingrese un nombre.'
                  : (value.length < 2)
                      ? 'El nombre debe de ser de dos letras como mínimo.'
                      : null,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
            ),
            const SizedBox(height: 20),
            CustomField(
              initialValue: widget.user?.correo,
              labelText: 'Correo',
              validator: (value) => !EmailValidator.validate(value ?? '')
                  ? 'Email no válido'
                  : null,
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: role,
              hint: Text(widget.user?.rol ?? 'Rol'),
              onChanged: (String? newValue) {
                userFormProvider.copyUserWith(rol: newValue);
              },
              items: roleList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                label: Text('Rol'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<Branch>(
              value: branch, // Asegúrate de que 'branch' sea de tipo 'Branch'
              hint: Text(widget.user?.sucursal.municipio ?? 'Sucursal'),
              onChanged: (Branch? newValue) {
                if (newValue != null) {
                  userFormProvider.copyUserWith(
                      sucursal:
                          newValue); // Asume que copyUserWith puede manejar un objeto Branch
                }
              },
              items: sucursales.map<DropdownMenuItem<Branch>>((Branch value) {
                return DropdownMenuItem<Branch>(
                  value: value,
                  child: Text(value
                      .municipio), // Asume que 'definicion' es una propiedad de la clase Branch
                );
              }).toList(),
              decoration: const InputDecoration(
                label: Text('Sucursal'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            const SizedBox(height: 20),
            SaveButton(user: widget.user),
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
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(10.0),
      ),
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
          child: ElevatedButton(
            style: ButtonStyle(
              shape:
                  MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
            ),
            onPressed: () async {
              print('el id del usuario es:' + user!.uid);
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                withData: true,
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'jpeg'],
                allowMultiple: false,
              );

              if (result != null) {
                PlatformFile file = result.files.first;
                NotificationsService.showBusyIndicator(context);

                final resp = await userFormProvider.uploadImage(
                    '/uploads/usuarios/${user.uid}', file.bytes!);

                // Asumiendo que tienes un método para actualizar la información del usuario
                usersProvider.refreshUser(resp!);

                // Suponiendo que quieres cerrar el indicador de ocupado y/o una ventana emergente
                Navigator.of(context).pop();
              } else {
                print('No hay imagen seleccionada');
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }
}
