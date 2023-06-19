import 'package:admin_dashboard/proy/models/category.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/providers/categories_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/views/products/productview_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProducts extends StatefulWidget {
  final List<Producto> productos;

  const CardProducts({Key? key, required this.productos}) : super(key: key);

  @override
  State<CardProducts> createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  Categoria? categoria;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;
    if (width >= 768 && width < 1200) {
      crossAxisCount = 2;
    } else if (width >= 1200) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 4.95 / 3,
        crossAxisSpacing: 10,
      ),
      itemCount: widget.productos.length,
      itemBuilder: (context, index) {
        final producto = widget.productos[index];

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: producto.img == null
              ? Image.asset(
                  'assets/no-image.jpg',
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                )
              : FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif',
                  image: producto.img!,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
        );

        return Center(
          child: Dismissible(
            key: UniqueKey(),
            background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 50),
                child: const Icon(Icons.delete_outline_rounded)),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
              } else {}
            },
            confirmDismiss: (direction) async {
              // Pinned o Toggle
              return await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('¿Esta seguro de borrar el producto?'),
                    content: Text('Borrar definitivamente ${producto.nombre}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () async {
                            await Provider.of<ProductsProvider>(context,
                                    listen: false)
                                .deleteProduct(producto.id);
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Si, borrar')),
                    ],
                  );
                },
              );
            },
            child: SizedBox(
              child: Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () async {
                    String categoryId = producto.categoria.id;

                    categoria =
                        await categoryProvider.getCategoryById(categoryId);
                    showUserDialog(
                      'Actualizar producto',
                      ProductViewTest(
                        id: producto.id,
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          margin: const EdgeInsets.all(16),
                          child: image,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.nombre,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                producto.categoria.nombre,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Caja: Bs. ${producto.precioCaja}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Unidad: Bs. ${producto.precioPorUnidad}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Color: ${producto.color}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                producto.disponible
                                    ? 'Disponible'
                                    : 'No disponible',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: producto.disponible
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget padding(Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: widget,
    );
  }

  Future<void> showUserDialog(String title, Widget content) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(child: content),
        );
      },
    );
  }
}
