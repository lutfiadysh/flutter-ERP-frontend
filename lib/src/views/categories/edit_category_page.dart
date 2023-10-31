import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCategoryPage extends StatefulWidget {
  final Categoria data;
  const EditCategoryPage({super.key, required this.data});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  String? selectedDimensiones;
  String? selectedAcabado;
  String? selectedMaterial;
  TextEditingController precioCajaController = TextEditingController();
  TextEditingController unidadesPerCajaController = TextEditingController();
  bool isSubmit = false;
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
  void initState() {
    setState(() {
      selectedDimensiones = widget.data.dimensiones;
      selectedAcabado = widget.data.acabado;
      selectedMaterial = widget.data.material;
      precioCajaController.text = widget.data.precioCaja.toString();
      unidadesPerCajaController.text = widget.data.unidadesPorCaja.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DropdownButtonFormField<String>(
                  value: selectedDimensiones,
                  hint: const Text('Dimensiones'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDimensiones = newValue!;
                    });
                  },
                  items: dimensionesList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorConst.blue,
                        ),
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedAcabado,
                  hint: const Text('Acabado'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAcabado = newValue!;
                    });
                  },
                  items:
                      acabadoList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorConst.blue,
                        ),
                      )),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DropdownButtonFormField<String>(
                  value: selectedMaterial,
                  hint: const Text('Material'),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMaterial = newValue!;
                    });
                  },
                  items: materialList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: ColorConst.blue,
                        ),
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: precioCajaController,
                  decoration: InputDecoration(
                      labelText: 'Precio de caja',
                      hintText: 'Ingrese el precio de la caja',
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
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: unidadesPerCajaController,
                  decoration: InputDecoration(
                      labelText: 'Cantidad de piezas por caja',
                      hintText: 'Ingrese la cantidad de piezas',
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
              ),
              const SizedBox(height: 20),
              // TextFormField(
              //   initialValue: widget.categoria?.precioCaja.toString() ?? '',
              //   onChanged: (value) => precioCaja = value,
              //   keyboardType: TextInputType.number,
              //   decoration: const InputDecoration(
              //     labelText: 'Precio de caja',
              //     hintText: 'Ingrese el precio de la caja',
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 80,
        color: Colors.white,
        child: ElevatedButton(
          onPressed: !isSubmit
              ? () async {
                  try {
                    if (selectedDimensiones != null &&
                        selectedAcabado != null &&
                        selectedMaterial != null &&
                        precioCajaController.text.isNotEmpty &&
                        unidadesPerCajaController.text.isNotEmpty) {
                      setState(() {
                        isSubmit = true;
                      });
                      await categoryProvider
                          .updateCategory(
                        widget.data.id,
                        selectedDimensiones!,
                        selectedAcabado!,
                        selectedMaterial!,
                        double.parse(precioCajaController.text!),
                        int.parse(unidadesPerCajaController.text!),
                      )
                          .then((value) {
                        setState(() {
                          isSubmit = false;
                        });
                        Navigator.pop(context);

                        NotificationsService.showSnackbar(
                            'Categoría actualizada!');
                      });
                    } else {
                      setState(() {
                        isSubmit = false;
                      });
                      NotificationsService.showSnackbarError(
                          'No se pudo guardar la categoría');
                    }
                  } catch (e) {
                    setState(() {
                      isSubmit = false;
                    });
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar la categoría');
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 32, 60),
            backgroundColor: ColorConst.primary,
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
    );
  }
}
