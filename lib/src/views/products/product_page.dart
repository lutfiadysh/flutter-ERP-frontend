import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/products/create_product_page.dart';
import 'package:admin_dashboard/src/views/products/edit_product_page.dart';
import 'package:admin_dashboard/src/views/products/productsview_test.dart';
import 'package:admin_dashboard/src/views/providers/create_provider_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductsProvider>(context).productos;
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: false,
        titleSpacing: 0,
        title: const Text(
          Strings.products,
          style: TextStyle(
            fontSize: 16,
            color: ColorConst.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProductPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const Icon(
                EneftyIcons.add_bold,
              ),
            ),
          ),
        ],
      ),
      body: productos.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: productos.map((e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: e.img != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          e.img.toString(),
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image:
                                            AssetImage('assets/no-image.jpg'),
                                        fit: BoxFit.cover),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(16),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: ColorConst.primary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      e.categoria.nombre,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.nombre,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: e.disponible
                                                ? ColorConst.teal
                                                    .withOpacity(.16)
                                                : ColorConst.error
                                                    .withOpacity(.16)),
                                        child: Text(
                                          e.disponible
                                              ? 'Disponible'
                                              : 'No disponible',
                                          style: TextStyle(
                                            fontSize: 8,
                                            color: e.disponible
                                                ? ColorConst.teal
                                                : ColorConst.error,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FxBox.h12,
                                  Text(
                                    "Caja: Bs.${e.precioCaja.toString()}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Unidad: Bs. ${e.precioPorUnidad}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              (context),
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProductPage(
                                                          data: e)));
                                        },
                                        child: Icon(
                                          EneftyIcons.edit_2_bold,
                                          color: ColorConst.warning,
                                        ),
                                      ),
                                    ],
                                  ),
                                  FxBox.h6,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Color: ${e.color}"),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: const Text(
                                                    '¿Esta seguro de borrar el producto?'),
                                                content: Text(
                                                    'Borrar definitivamente ${e.nombre}?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      },
                                                      child: const Text('No')),
                                                  TextButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop(true);
                                                        await Provider.of<
                                                                    ProductsProvider>(
                                                                context,
                                                                listen: false)
                                                            .deleteProduct(
                                                                e.id);
                                                      },
                                                      child: const Text(
                                                          'Si, borrar')),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          EneftyIcons.trash_outline,
                                          color: ColorConst.error,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    width: MediaQuery.of(context).size.width - 32,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
    );
  }
}
