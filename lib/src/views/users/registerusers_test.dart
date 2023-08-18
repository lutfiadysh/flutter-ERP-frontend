import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:admin_dashboard/proy/providers/branches_provider.dart';
import 'package:admin_dashboard/proy/providers/register_form_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterViewTest extends StatefulWidget {
  const RegisterViewTest({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterViewTest> {
  String? role;
  bool _isLoading = false;
  Branch? branch;
  List<String> roleList = [
    "Vendedor",
    "Supervisor",
    "Administrador",
    "Inventarios"
  ];

  @override
  void initState() {
    super.initState();

    Provider.of<BranchesProvider>(context, listen: false).getBranches();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    final sucursales = Provider.of<BranchesProvider>(context).branches;

    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Center(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: registerFormProvider.formkey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nombre',
                        contentPadding: EdgeInsets.all(10.0),
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
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: role,
                      hint: const Text('Selecciona el rol'),
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo Electrónico',
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no válido';
                        }
                        return null;
                      },
                      onChanged: (value) => registerFormProvider.email = value,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                        contentPadding: EdgeInsets.all(10.0),
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
                    const SizedBox(height: 20),
                    DropdownButtonFormField<Branch>(
                      value:
                          branch, // Asegúrate de que 'branch' sea de tipo 'Branch'
                      hint: const Text('Sucursal'),
                      onChanged: (Branch? newValue) {
                        if (newValue != null) {
                          setState(() {
                            branch = newValue;
                          });
                        }
                      },
                      items: sucursales
                          .map<DropdownMenuItem<Branch>>((Branch value) {
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
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              setState(() {
                                _isLoading = true;
                              });
                              final saved = await userProvider.register(
                                  registerFormProvider.email,
                                  registerFormProvider.password,
                                  registerFormProvider.name,
                                  branch!.id,
                                  role!);
                              setState(() {
                                _isLoading = false;
                              });
                              if (saved) {
                                Navigator.pop(context);
                                NotificationsService.showSnackbar(
                                    'Usuario actualizado');
                              } else {
                                NotificationsService.showSnackbarError(
                                    'No se pudo guardar');
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Colors.blue, // This is the color of the text
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Crear cuenta"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
