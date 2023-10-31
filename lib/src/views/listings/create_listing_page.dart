import 'package:admin_dashboard/blocs/listing_create/listing_create_bloc.dart';
import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class CreateListingPage extends StatefulWidget {
  const CreateListingPage({super.key});

  @override
  State<CreateListingPage> createState() => _CreateListingPageState();
}

class _CreateListingPageState extends State<CreateListingPage> {
  Producto? productoDialog;
  int quantityPieces = 0;
  int quantityBoxes = 0;
  double precioUnitarioPiezas = 0.0;
  double precioUnitarioCajas = 0.0;
  List<Stock> stocks = [];
  bool isProductSelected = false;

  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  void calculateTotalPrices() {
    setState(() {
      precioUnitarioPiezas = productoDialog!.precioPorUnidad?.toDouble() ?? 0.0;
      precioUnitarioCajas = productoDialog!.precioCaja?.toDouble() ?? 0.0;
      checkIfFieldsAreNotEmpty();
    });
  }

  void checkIfFieldsAreNotEmpty() {
    if ((quantityPieces > 0 || quantityBoxes > 0) && productoDialog != null) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  int getTotalStock(bool isPiece) {
    if (productoDialog == null) {
      return 0;
    }

    int totalStock = 0;

    for (var stock in stocks) {
      if (stock.producto.id == productoDialog!.id) {
        if (isPiece) {
          totalStock +=
              ((stock.cantidadPiezas ?? 0) - (stock.reservadoPiezas ?? 0)) +
                  (stock.entrantePiezas ?? 0);
        } else {
          totalStock +=
              ((stock.cantidadCajas ?? 0) - (stock.reservadoCajas ?? 0)) +
                  (stock.entranteCajas ?? 0);
        }
      }
    }

    return totalStock;
  }

  int getBranchStock(bool isPiece, String branchId) {
    if (productoDialog == null) {
      return 0;
    }

    int totalStock = 0;

    for (var stock in stocks) {
      if (stock.producto.id == productoDialog!.id &&
          stock.sucursal.id == branchId) {
        if (isPiece) {
          totalStock +=
              ((stock.cantidadPiezas ?? 0) - (stock.reservadoPiezas ?? 0)) +
                  (stock.entrantePiezas ?? 0);
        } else {
          totalStock +=
              ((stock.cantidadCajas ?? 0) - (stock.reservadoCajas ?? 0)) +
                  (stock.entranteCajas ?? 0);
        }
      }
    }

    return totalStock;
  }

  String getAllBranchStocks(bool isPiece) {
    Map<String, int> branchStocks = {};
    String unitType = isPiece ? "piezas" : "cajas";

    for (var stock in stocks) {
      if (stock.producto.id == productoDialog!.id) {
        var branchMunicipio =
            stock.sucursal.municipio; // Acceso al campo municipio
        var codigoSucursal =
            stock.sucursal.codigoSucursal; // Acceso al campo codigoSucursal
        var currentStock = 0;

        if (isPiece) {
          currentStock +=
              ((stock.cantidadPiezas ?? 0) - (stock.reservadoPiezas ?? 0)) +
                  (stock.entrantePiezas ?? 0);
        } else {
          currentStock +=
              ((stock.cantidadCajas ?? 0) - (stock.reservadoCajas ?? 0)) +
                  (stock.entranteCajas ?? 0);
        }

        String uniqueKey =
            "$branchMunicipio $codigoSucursal"; // Creando una clave única
        if (branchStocks.containsKey(uniqueKey)) {
          branchStocks[uniqueKey] = branchStocks[uniqueKey]! + currentStock;
        } else {
          branchStocks[uniqueKey] = currentStock;
        }
      }
    }

    var stocksText = branchStocks.entries
        .map((e) => " / Sucursal en ${e.key}: ${e.value} $unitType / ")
        .join(", ");

    return stocksText;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductsProvider>(context, listen: false).getProducts();
      final stocksProvider =
          Provider.of<StocksProvider>(context, listen: false);
      stocksProvider.getStocks().then((value) {
        setState(() {
          stocks = stocksProvider.stocks;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductsProvider>(context).productos;
    final userFormProvider = Provider.of<AuthProvider>(context);
    final user = userFormProvider.user!;
    return WillPopScope(
      onWillPop: () async {
        context.read<ListingCreateBloc>().add(BackToInitial());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              context.read<ListingCreateBloc>().add(BackToInitial());
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DropdownSearch<Producto>(
                          popupProps: const PopupProps.menu(
                            showSelectedItems: true,
                            showSearchBox: true,
                          ),
                          items: productos,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Producto",
                              hintText: "Seleccione un producto",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          onChanged: (Producto? producto) {
                            setState(() {
                              productoDialog = producto;
                              if (productoDialog != null) {
                                calculateTotalPrices();
                                isProductSelected = true;
                              } else {
                                isProductSelected = false;
                              }
                            });
                          },
                          selectedItem: productoDialog,
                          itemAsString: (Producto u) => u.nombre,
                          compareFn: (Producto a, Producto b) =>
                              a.nombre == b.nombre,
                        ),
                      ),
                      isProductSelected
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 18,
                              child: Marquee(
                                text: getAllBranchStocks(false),
                              ),
                            )
                          : const Text("Seleccione un producto"),
                      TextFormField(
                        enabled: isProductSelected,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            quantityBoxes = int.tryParse(value) ?? 0;
                            calculateTotalPrices();
                          });
                        },
                        validator: (value) {
                          int parsedValue = int.tryParse(value!) ?? 0;
                          if (parsedValue > getTotalStock(false)) {
                            return 'No puedes seleccionar más cajas de las disponibles';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: "Cantidad de cajas",
                          hintText:
                              "En sucursal: ${getBranchStock(false, user.sucursal.id)}, Total: ${getTotalStock(false)}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      isProductSelected
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 18,
                              child: Marquee(
                                text: getAllBranchStocks(true),
                              ),
                            )
                          : const Text("Seleccione un producto"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          enabled: isProductSelected,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              quantityPieces = int.tryParse(value) ?? 0;
                              calculateTotalPrices();
                            });
                          },
                          validator: (value) {
                            int parsedValue = int.tryParse(value!) ?? 0;
                            if (parsedValue > getTotalStock(false)) {
                              return 'No puedes seleccionar más cajas de las disponibles';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: "Cantidad de piezas",
                            hintText:
                                "En sucursal: ${getBranchStock(true, user.sucursal.id)}, Total: ${getTotalStock(true)}",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildResultText(
                            "Precio por pieza", precioUnitarioPiezas),
                        buildResultText("Precio por caja", precioUnitarioCajas),
                        buildResultText("Precio total unidades",
                            precioUnitarioPiezas * quantityPieces),
                        buildResultText("Precio total cajas",
                            precioUnitarioCajas * quantityBoxes),
                        buildResultText(
                            "Precio total",
                            (precioUnitarioPiezas * quantityPieces) +
                                (precioUnitarioCajas * quantityBoxes)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width - 32, 50),
              backgroundColor: ColorConst.primary,
            ),
            onPressed: (productoDialog == null ||
                    (quantityPieces == 0 && quantityBoxes == 0))
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      double precioTotalPiezas =
                          precioUnitarioPiezas * quantityPieces;
                      double precioTotalCajas =
                          precioUnitarioCajas * quantityBoxes;
                      double precioTotal = precioTotalPiezas + precioTotalCajas;

                      final productoElement = ProductoElement(
                        producto: productoDialog!,
                        cantidadPiezas: quantityPieces,
                        cantidadCajas: quantityBoxes,
                        precioTotal: precioTotal,
                        precioTotalCajas: precioTotalCajas,
                        precioTotalPiezas: precioTotalPiezas,
                        precioUnitarioCajas: productoDialog!.precioCaja!,
                        precioUnitarioPiezas: productoDialog!.precioPorUnidad!,
                      );
                      context
                          .read<ListingCreateBloc>()
                          .add(AddProductList(productElement: productoElement));
                      // widget.onProductAdded(productoElement);
                      // Navigator.pop(context,
                      //     productoElement); // Devuelve el productoElement al widget padre
                    }
                  },
            child: const Text(
              "Añadir al listado",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResultText(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: const TextStyle(
                fontSize: 16,
              )),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
