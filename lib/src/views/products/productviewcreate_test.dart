import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductViewCreateTest extends StatefulWidget {
  final Producto? producto;
  final Categoria? categoria;

  const ProductViewCreateTest({super.key, this.producto, this.categoria});

  @override
  State<ProductViewCreateTest> createState() => _ProductViewCreateTestState();
}

class _ProductViewCreateTestState extends State<ProductViewCreateTest> {
  String nombre = '';
  String categoria = '';
  String? id;
  Categoria? first;
  double? precioPorCaja;
  double? precioPorUnidad;
  final TextEditingController precioPorCajaController = TextEditingController();
  final TextEditingController precioPorUnidadController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.producto?.id;
    nombre = widget.producto?.nombre ?? '';
    categoria = widget.producto?.categoria.nombre ?? '';

    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;

    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return Column(
      children: [
        TextFormField(
          initialValue: widget.producto?.nombre ?? '',
          onChanged: (value) => nombre = value,
          decoration: const InputDecoration(
            hintText: 'Introduce el nombre del producto',
            labelText: 'Nombre del producto',
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
              print(first);
            });
          },
          items: categorias.map<DropdownMenuItem<Categoria>>((Categoria value) {
            return DropdownMenuItem<Categoria>(
              value: value,
              child: Text(value.nombre),
            );
          }).toList(),
          decoration: const InputDecoration(
            hintText: 'Selecciona una categoría',
            labelText: 'Categoría del producto',
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
          decoration: const InputDecoration(
            hintText: 'Introduce el precio por caja',
            labelText: 'Precio por caja',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: precioPorUnidadController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          enabled: first != null,
          decoration: const InputDecoration(
            hintText: 'El precio por unidad se calculará automáticamente',
            labelText: 'Precio por unidad',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: OutlinedButton(
            onPressed: () async {
              try {
                if (id == null) {
                  await productProvider.newProduct(
                      nombre, first!.id, precioPorCaja, precioPorUnidad);
                  NotificationsService.showSnackbar('Producto $nombre creado!');
                }
                Navigator.of(context).pop();
              } catch (e) {
                Navigator.of(context).pop();
                NotificationsService.showSnackbarError(
                    'No se pudo guardar el producto');
              }
            },
            child: Text('Guardar'),
          ),
        ),
      ],
    );
  }
}

double calcularPrecioPorUnidad(double precioPorCaja, int piezasPorCaja) {
  double precioPorUnidad = precioPorCaja / piezasPorCaja;
  precioPorUnidad += precioPorUnidad * 0.10; // Añadir un 10% adicional
  return precioPorUnidad;
}
