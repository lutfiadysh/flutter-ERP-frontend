import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/models/provider.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pricePerBoxController = TextEditingController();
  TextEditingController pricePerPcsController = TextEditingController();
  Proveedor? selectedProvider;
  Categoria? selectedCategory;
  bool isSubmit = false;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    Provider.of<ProvidersProvider>(context, listen: false).getProviders();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    final proveedores = Provider.of<ProvidersProvider>(context).proveedores;
    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Nombre del Producto',
                      hintText: 'Introduce el nombre del producto',
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: DropdownButtonFormField<Categoria>(
                  // value: categoryObject,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  items: categorias
                      .map<DropdownMenuItem<Categoria>>((Categoria value) {
                    return DropdownMenuItem<Categoria>(
                      value: value,
                      child: Text(value.nombre),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Categoría',
                    hintText: 'Selecciona una categoría',
                    // hintStyle: theme.textTheme.bodyLarge,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: ColorConst.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<Proveedor>(
                  // value: providerObject,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (value) {
                    setState(() {
                      selectedProvider = value;
                    });
                  },
                  items: proveedores
                      .map<DropdownMenuItem<Proveedor>>((Proveedor value) {
                    return DropdownMenuItem<Proveedor>(
                      value: value,
                      child: Text(value.nombre),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Proveedor',
                    hintText: 'Selecciona un proveedor',
                    // hintStyle: theme.textTheme.bodyLarge,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: ColorConst.blue, width: 2.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  readOnly:
                      selectedCategory == null || selectedProvider == null,
                  controller: pricePerBoxController,
                  decoration: InputDecoration(
                      labelText: 'Precio por Caja',
                      hintText: 'Introduce el precio por caja',
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
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  readOnly:
                      selectedCategory == null || selectedProvider == null,
                  controller: pricePerPcsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Precio por Unidad',
                      hintText:
                          'El precio por unidad se calculará automáticamente',
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
              FxBox.h16,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: !isSubmit
              ? () async {
                  try {
                    if (nameController.text.isNotEmpty &&
                        selectedCategory != null &&
                        selectedProvider != null &&
                        pricePerBoxController.text.isNotEmpty &&
                        pricePerPcsController.text.isNotEmpty) {
                      productProvider
                          .newProduct(
                              nameController.text,
                              selectedCategory!.id,
                              selectedProvider!.id,
                              double.parse(pricePerBoxController.text),
                              double.parse(pricePerPcsController.text))
                          .then((value) {
                        setState(() {
                          isSubmit = false;
                        });
                        finishedSuccess();
                      });
                    } else {
                      setState(() {
                        isSubmit = false;
                      });
                      finishFailure();
                    }
                  } catch (e) {
                    setState(() {
                      isSubmit = false;
                    });
                    finishFailure();
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
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

  void finishedSuccess() {
    NotificationsService.showSnackbar(
        'Producto ${nameController.text} creado!');

    Navigator.of(context).pop();
  }

  void finishFailure() {
    // Navigator.of(context).pop();
    NotificationsService.showSnackbarError('No se pudo guardar el producto');
  }
}
