import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:admin_dashboard/proy/providers/branches_provider.dart';
import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  String? selectedRole;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Branch? selectedBranch;
  bool issubmit = false;
  List<String> roleList = [
    "Vendedor",
    "Supervisor",
    "Administrador",
    "Inventarios"
  ];

  @override
  void initState() {
    Provider.of<BranchesProvider>(context, listen: false).getBranches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sucursales = Provider.of<BranchesProvider>(context).branches;
    final userProvider = Provider.of<UsersProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: Colors.black.withOpacity(.12),
                      blurRadius: 16,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Nombre',
                          hintText: 'Nombre',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    FxBox.h24,
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          hintText: 'example@mail.com',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    FxBox.h24,
                    DropdownButtonFormField<String>(
                      onChanged: (val) {
                        setState(() {
                          selectedRole = val;
                        });
                      },
                      items: roleList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              value), // Asume que 'definicion' es una propiedad de la clase Branch
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        label: const Text('Selecciona el rol'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                      ),
                    ),
                    FxBox.h24,
                    DropdownButtonFormField<Branch>(
                      // value:
                      //     branch, // Asegúrate de que 'branch' sea de tipo 'Branch'
                      hint: const Text('Sucursal'),
                      onChanged: (Branch? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedBranch = newValue;
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
                      decoration: InputDecoration(
                        label: Text('Sucursal'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                      ),
                    ),
                    FxBox.h24,
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: !issubmit
                  ? () async {
                      setState(() {
                        issubmit = true;
                      });
                      if (selectedBranch != null && selectedRole != null) {
                        final saved = await userProvider.register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            selectedBranch!.id,
                            selectedRole!);
                        onFinished(saved);
                      } else {
                        NotificationsService.showSnackbarError(
                            'Please complete the form');
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
                backgroundColor: ColorConst.blue,
              ),
              child: const Text(
                "Crear cuenta",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onFinished(saved) {
    if (saved) {
      Navigator.pop(context);
      NotificationsService.showSnackbar('Usuario actualizado');
    } else {
      NotificationsService.showSnackbarError('No se pudo guardar');
    }
    setState(() {
      issubmit = false;
    });
  }
}
