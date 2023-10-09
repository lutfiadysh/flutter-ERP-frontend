import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/provider.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewCreateTest extends StatefulWidget {
  final Producto? producto;
  final Categoria? categoria;

  const ProductViewCreateTest({Key? key, this.producto, this.categoria})
      : super(key: key);

  @override
  State<ProductViewCreateTest> createState() => _ProductViewCreateTestState();
}

class _ProductViewCreateTestState extends State<ProductViewCreateTest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nombre = '';
  String categoria = '';
  String? id;
  Categoria? first;
  Proveedor? proveedor;
  double? precioPorCaja;
  double? precioPorUnidad;
  final TextEditingController precioPorCajaController = TextEditingController();
  final TextEditingController precioPorUnidadController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    id = widget.producto?.id;
    nombre = widget.producto?.nombre ?? '';
    categoria = widget.producto?.categoria.nombre ?? '';

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;
    final theme = Theme.of(context);
    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          TextFormField(
            initialValue: widget.producto?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: InputDecoration(
              labelText: 'Nombre del Producto',
              hintText: 'Introduce el nombre del producto',
              hintStyle: theme.textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColorDark, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<Categoria>(
            value: first,
            iconSize: 24,
            elevation: 16,
            onChanged: (value) {
              setState(() {
                first = value;
              });
            },
            items:
                categorias.map<DropdownMenuItem<Categoria>>((Categoria value) {
              return DropdownMenuItem<Categoria>(
                value: value,
                child: Text(value.nombre),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Categoría',
              hintText: 'Selecciona una categoría',
              hintStyle: theme.textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColorDark, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: precioPorCajaController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            enabled: first != null,
            onChanged: (value) {
              if (first != null && value.isNotEmpty) {
                precioPorCaja = double.parse(value);
                precioPorUnidad = calcularPrecioPorUnidad(
                    precioPorCaja!, first!.unidadesPorCaja);
                precioPorUnidadController.text =
                    precioPorUnidad!.toStringAsFixed(2);
              } else {
                precioPorUnidadController.text = '';
              }
            },
            decoration: InputDecoration(
              labelText: 'Precio por Caja',
              hintText: 'Introduce el precio por caja',
              hintStyle: theme.textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColorDark, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: precioPorUnidadController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            enabled: first != null,
            decoration: InputDecoration(
              labelText: 'Precio por Unidad',
              hintText: 'El precio por unidad se calculará automáticamente',
              hintStyle: theme.textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.primaryColorDark, width: 2.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    if (id == null) {
                      await productProvider.newProduct(
                          nombre, first!.id, precioPorCaja, precioPorUnidad);
                      NotificationsService.showSnackbar(
                          'Producto $nombre creado!');
                    }
                    Navigator.of(context).pop();
                  } catch (e) {
                    Navigator.of(context).pop();
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar el producto');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                textStyle: theme.textTheme.labelLarge,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text('Guardar'),
            ),
          ),
        ],
      ),
    );
  }

  double calcularPrecioPorUnidad(double precioPorCaja, int piezasPorCaja) {
    double precioPorUnidad = precioPorCaja / piezasPorCaja;
    precioPorUnidad += precioPorUnidad * 0.10; // Add an additional 10%

    double fractionalPart = precioPorUnidad - precioPorUnidad.floor();
    if (fractionalPart < 0.25) {
      precioPorUnidad = precioPorUnidad.floorToDouble();
    } else if (fractionalPart >= 0.25 && fractionalPart < 0.75) {
      precioPorUnidad = precioPorUnidad.floorToDouble() + 0.5;
    } else {
      precioPorUnidad = precioPorUnidad.floorToDouble() + 1.0;
    }

    return precioPorUnidad;
  }
}
