import 'package:admin_dashboard/proy/providers/register_form_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewTest extends StatefulWidget {
  const RegisterViewTest({Key? key}) : super(key: key);

  @override
  State<RegisterViewTest> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterViewTest> {
  String? role;

  List<String> roleList = [
    "Vendedor",
    "Supervisor",
    "Administrador",
    "Inventarios"
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(
          builder: (context) {
            final registerFormProvider =
                Provider.of<RegisterFormProvider>(context, listen: false);
            return Center(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: registerFormProvider.formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre',
                        ),
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Nombre no valido';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DropdownButtonFormField<String>(
                        value: role,
                        hint: Text('Selecciona el rol'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            role = newValue!;
                          });
                        },
                        items: roleList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo Electrónico',
                        ),
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no válido';
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                        ),
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Contraseña no valida';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: OutlinedButton(
                        onPressed: () async {
                          final saved = await userProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name,
                              role!);
                          if (saved) {
                            Navigator.pop(context);
                            NotificationsService.showSnackbar(
                                'Usuario actualizado');
                          } else {
                            NotificationsService.showSnackbarError(
                                'No se pudo guardar');
                          }
                        },
                        child: const Text("Crear cuenta"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
