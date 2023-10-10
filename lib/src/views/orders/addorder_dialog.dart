import 'package:admin_dashboard/proy/models/order.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/reserve.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/reserves_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddOrderDialog extends StatefulWidget {
  final Function(ProductoDetalle) onProductAdded;
  final String? proveedorId;

  const AddOrderDialog(
      {Key? key, required this.onProductAdded, required this.proveedorId})
      : super(key: key);

  @override
  _AddOrderDialogState createState() => _AddOrderDialogState();
}

class _AddOrderDialogState extends State<AddOrderDialog> {
  late String proveedorId;
  Producto? productoDialog;
  int quantityPieces = 0;
  int quantityBoxes = 0;
  double precioUnitarioPiezas = 0.0;
  double precioUnitarioCajas = 0.0;
  List<Reserva> reservas = [];
  bool isProductSelected = false;
  List<Producto> filteredProductos = [];

  final _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  void defineProvider() {
    if (widget.proveedorId != null) {
      proveedorId = widget.proveedorId!;
    } else {
      proveedorId = productoDialog!.proveedor!.id;
    }
  }

  void checkIfFieldsAreNotEmpty() {
    if ((quantityPieces > 0 || quantityBoxes > 0) && productoDialog != null) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
  }

  int getReserveProduct(String? productoId) {
    return reservas.where((reserva) => reserva.producto?.id == productoId).fold(
        0, (total, current) => total + (current.sumatoria?.totalCajas ?? 0));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productosProvider =
          Provider.of<ProductsProvider>(context, listen: false);
      final reservesProvider =
          Provider.of<ReservesProvider>(context, listen: false);

      // Filtramos los productos basados en el proveedorId si existe.
      if (widget.proveedorId != null) {
        filteredProductos = productosProvider.productos
            .where((producto) => producto.proveedor!.id == widget.proveedorId)
            .toList();
      } else {
        filteredProductos = productosProvider.productos;
      }

      reservesProvider.getReserves().then((value) {
        setState(() {
          reservas = reservesProvider.reservas;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Agregar producto"),
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownSearch<Producto>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: filteredProductos,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Producto",
                      hintText: "Seleccione un producto",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  onChanged: (Producto? producto) {
                    setState(() {
                      productoDialog = producto;
                      if (productoDialog != null) {
                        isProductSelected = true;
                      } else {
                        isProductSelected = false;
                      }
                    });
                  },
                  selectedItem: productoDialog,
                  itemAsString: (Producto u) =>
                      "${u.nombre} - ${u.proveedor!.nombre}",
                  compareFn: (Producto a, Producto b) => a.nombre == b.nombre,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  enabled: isProductSelected,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      quantityBoxes = int.tryParse(value) ?? 0;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: "Cantidad de cajas",
                    hintText:
                        "Solicitadas: ${getReserveProduct(productoDialog?.id)}",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: (productoDialog == null ||
                          (quantityPieces == 0 && quantityBoxes == 0))
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final productoElement = ProductoDetalle(
                              producto: productoDialog!,
                              cantidadCajas: quantityBoxes,
                            );

                            widget.onProductAdded(productoElement);
                            Navigator.pop(context,
                                productoElement); // Devuelve el productoElement al widget padre
                          }
                        },
                  child: const Text("Añadir al listado"),
                ),
              ),
            ],
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
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(
            "\$${value.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
