import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';

class CategoryViewTest extends StatefulWidget {
  final Categoria? categoria;

  const CategoryViewTest({Key? key, this.categoria}) : super(key: key);

  @override
  State<CategoryViewTest> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryViewTest> {
  String? dimensiones;
  String? acabado;
  String? material;
  String? precioCaja;
  String? unidadesPorCaja;

  List<String> dimensionesList = [
    "60x60cm",
    "30x30cm",
    "45x45cm",
    "30x60cm",
    "60x120cm"
  ];

  List<String> acabadoList = ["brillante", "mate", "texturizado"];

  List<String> materialList = ["ceramica", "porcelanato", "gres"];

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: dimensiones,
            hint: const Text('Dimensiones'),
            onChanged: (String? newValue) {
              setState(() {
                dimensiones = newValue!;
              });
            },
            items:
                dimensionesList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: acabado,
            hint: const Text('Acabado'),
            onChanged: (String? newValue) {
              setState(() {
                acabado = newValue!;
              });
            },
            items: acabadoList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: material,
            hint: const Text('Material'),
            onChanged: (String? newValue) {
              setState(() {
                material = newValue!;
              });
            },
            items: materialList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.precioCaja.toString() ?? '',
            onChanged: (value) => precioCaja = value,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Precio de caja',
              hintText: 'Ingrese el precio de la caja',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.unidadesPorCaja.toString() ?? '',
            onChanged: (value) => unidadesPorCaja = value,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cantidad de piezas por caja',
              hintText: 'Ingrese la cantidad de piezas',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () async {
                try {
                  if (widget.categoria?.id == null) {
                    await categoryProvider.newCategory(
                      dimensiones!,
                      acabado!,
                      material!,
                      double.parse(precioCaja!),
                      int.parse(unidadesPorCaja!),
                    );
                    NotificationsService.showSnackbar('Categoría creada!');
                  } else {
                    await categoryProvider.updateCategory(
                      widget.categoria!.id,
                      dimensiones!,
                      acabado!,
                      material!,
                      double.parse(precioCaja!),
                      int.parse(unidadesPorCaja!),
                    );

                    NotificationsService.showSnackbar('Categoría actualizada!');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError(
                      'No se pudo guardar la categoría');
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
