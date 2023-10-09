import 'package:admin_dashboard/proy/models/provider.dart';
import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';

class ProviderViewTest extends StatefulWidget {
  final Proveedor? proveedor;

  const ProviderViewTest({Key? key, this.proveedor}) : super(key: key);

  @override
  State<ProviderViewTest> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<ProviderViewTest> {
  String? nombre;
  String? telefono;
  String? correo;

  @override
  Widget build(BuildContext context) {
    final providerProvider =
        Provider.of<ProvidersProvider>(context, listen: false);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.proveedor?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: const InputDecoration(
              labelText: 'Nombre de proveedor',
              hintText: 'Ingrese el nombre del proveedor',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.proveedor?.telefono ?? '',
            onChanged: (value) => telefono = value,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Telefono del proveedor',
              hintText: 'Ingrese el numero de telefono del proveedor',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.proveedor?.correo ?? '',
            onChanged: (value) => correo = value,
            decoration: const InputDecoration(
              labelText: 'Correo del proveedor',
              hintText: 'Ingrese el correo del proveedor',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () async {
                try {
                  if (widget.proveedor?.id == null) {
                    await providerProvider.newProvider(
                      nombre!,
                      telefono!,
                      correo!,
                    );
                    NotificationsService.showSnackbar(
                        'Proveedor creado con exito!');
                  } else {
                    await providerProvider.updateProvider(
                      widget.proveedor!.id,
                      nombre!,
                      telefono!,
                      correo!,
                    );

                    NotificationsService.showSnackbar(
                        'Proveedor actualizado con exito!');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError(
                      'Error al crear/actualziar el proveedor');
                }
              },
              child: const Text("Guardar"),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color(0xff0f2041),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
