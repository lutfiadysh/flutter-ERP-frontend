import 'package:admin_dashboard/proy/models/order.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/orders_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  List<Producto> listProduct = [];
  List<ProductoDetalle> cartList = [];
  bool isSubmit = false;
  @override
  void initState() {
    final productosProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final orderProvider = Provider.of<OrdersProvider>(context, listen: false);
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        // listProduct = productosProvider.productos;
        for (var i = 0; i < productosProvider.productos.length; i++) {
          var e = productosProvider.productos[i];

          cartList.add(
            ProductoDetalle(producto: e, cantidadCajas: 0),
          );
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<AuthProvider>(context, listen: false);
    final orderProvider = Provider.of<OrdersProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: cartList.map((item) {
              var index = cartList.indexOf(item);
              var e = item.producto;
              return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 2),
                                  color: Colors.black.withOpacity(.12),
                                  blurRadius: 16,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  e!.img.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e!.nombre,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " (${e.color.toString()})",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                e.categoria.nombre,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                e.proveedor!.nombre,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: ColorConst.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    e.precioCaja.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Por Caja",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: ColorConst.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      item.cantidadCajas == 0
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  cartList[index].cantidadCajas += 1;
                                });
                              },
                              child: Container(
                                // padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: ColorConst.success,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  EneftyIcons.add_outline,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartList[index].cantidadCajas -= 1;
                                    });
                                  },
                                  child: Container(
                                    // padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: ColorConst.error,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      EneftyIcons.minus_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(item.cantidadCajas.toString())),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartList[index].cantidadCajas += 1;
                                    });
                                  },
                                  child: Container(
                                    // padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: ColorConst.success,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(
                                      EneftyIcons.add_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ],
                  ));
            }).toList(),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ElevatedButton(
            onPressed: !isSubmit
                ? () async {
                    try {
                      if (cartList.isNotEmpty) {
                        setState(() {
                          isSubmit = true;
                        });
                        List<ProductoDetalle> listProd = [];

                        for (var i = 0; i < cartList.length; i++) {
                          var e = cartList[i];
                          if (e.cantidadCajas > 0) {
                            listProd.add(e);
                          }
                        }
                        await orderProvider.newOrder(listProd).then((value) {
                          setState(() {
                            isSubmit = false;
                          });
                          Navigator.pop(context);
                          NotificationsService.showSnackbar(
                            'Pedido guardado con éxito.',
                          );
                        });
                      } else {
                        NotificationsService.showSnackbarError(
                          'No se pudo guardar el pedido.',
                        );
                      }
                    } catch (e) {
                      setState(() {
                        isSubmit = false;
                      });
                      NotificationsService.showSnackbarError(
                        'No se pudo guardar el pedido.',
                      );
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
      ),
    );
  }
}
