import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/views/products/card_products.dart';
import 'package:admin_dashboard/src/views/products/productviewcreate_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProductsViewTest extends StatefulWidget {
  const ProductsViewTest({super.key});

  @override
  State<ProductsViewTest> createState() => _ProductsViewTestState();
}

class _ProductsViewTestState extends State<ProductsViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductsProvider>(context).productos;
    final size = MediaQuery.of(context).size.height;
    // Obtén el ancho de la pantalla actual
    double screenWidth = MediaQuery.of(context).size.width;

    // Decide si es móvil o web según el ancho de pantalla
    bool isMobile = screenWidth < 600;
    return SizedBox(
      height: size - 75 - 95,
      child: Scaffold(
        appBar: AppBar(title: const Text("Productos")),
        body: CardProducts(productos: productos),
        floatingActionButton: isMobile
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  _showDialogProduct(context);
                },
              )
            : FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                label: const Text('Crear producto'),
                onPressed: () {
                  _showDialogProduct(context);
                },
              ),
      ),
    );
  }

  Future<dynamic> _showDialogProduct(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
          title: Text("Crear producto"),
          content: SingleChildScrollView(child: ProductViewCreateTest())),
    );
  }
}
