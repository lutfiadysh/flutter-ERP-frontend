import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class CreateProdiverPage extends StatefulWidget {
  const CreateProdiverPage({super.key});

  @override
  State<CreateProdiverPage> createState() => _CreateProdiverPageState();
}

class _CreateProdiverPageState extends State<CreateProdiverPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isSubmit = false;
  @override
  Widget build(BuildContext context) {
    final providerProvider =
        Provider.of<ProvidersProvider>(context, listen: false);
    return Scaffold(
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(.12),
                blurRadius: 16,
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Nombre de proveedor',
                    hintText: 'Ingrese el nombre del proveedor',
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Telefono del proveedor',
                    hintText: 'Ingrese el numero de telefono del proveedor',
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
                    labelText: 'Correo del proveedor',
                    hintText: 'Ingrese el correo del proveedor',
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
            ],
          ),
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
            onPressed: !isSubmit
                ? () async {
                    setState(() {
                      isSubmit = true;
                    });
                    await providerProvider.newProvider(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                    );
                    finished();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
              backgroundColor: ColorConst.blue,
            ),
            child: const Text(
              "Guardar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void finished() {
    setState(() {
      isSubmit = false;
    });
    Navigator.pop(context);
    NotificationsService.showSnackbar('Proveedor creado con exito!');
  }
}
