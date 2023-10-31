import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/provider.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/providers_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class EditProductPage extends StatefulWidget {
  final Producto data;
  const EditProductPage({
    super.key,
    required this.data,
  });

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pricePerBoxController = TextEditingController();
  TextEditingController pricePerPcsController = TextEditingController();
  Proveedor? selectedProvider;
  Categoria? selectedCategory;
  bool isSubmit = false;

  @override
  void initState() {
    setState(() {
      Provider.of<CategoriesProvider>(context, listen: false).getCategories();
      Provider.of<ProvidersProvider>(context, listen: false).getProviders();
      nameController.text = widget.data.nombre;
      pricePerPcsController.text = widget.data.precioPorUnidad.toString();
      pricePerBoxController.text = widget.data.precioCaja.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    if (categorias.isNotEmpty) {
      selectedCategory = categorias
          .where((element) => element.id == widget.data.categoria.id)
          .first;
    }

    final proveedores = Provider.of<ProvidersProvider>(context).proveedores;
    if (proveedores.isNotEmpty) {
      selectedProvider = proveedores
          .where((element) => element.id == widget.data.proveedor!.id)
          .first;
    }
    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final productsProvider = Provider.of<ProductsProvider>(context);
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
                  value: categorias.firstWhere(
                      (element) => element.id == widget.data.categoria.id),
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
                  value: proveedores.firstWhere(
                      (element) => element.id == widget.data.proveedor!.id),
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
                        pricePerBoxController.text.isNotEmpty &&
                        pricePerPcsController.text.isNotEmpty) {
                      setState(() {
                        isSubmit = true;
                      });
                      await productsProvider
                          .updateProduct(
                              widget.data.id,
                              nameController.text,
                              double.parse(pricePerBoxController.text),
                              double.parse(pricePerPcsController.text))
                          .then((value) {
                        setState(() {
                          Navigator.pop(context);
                          NotificationsService.showSnackbar(
                              'Producto actualizado');
                          isSubmit = false;
                        });
                      });
                    } else {
                      NotificationsService.showSnackbarError(
                          'No se pudo guardar');
                      setState(() {
                        isSubmit = false;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      isSubmit = false;
                    });

                    NotificationsService.showSnackbarError(
                        'No se pudo guardar');
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
}
