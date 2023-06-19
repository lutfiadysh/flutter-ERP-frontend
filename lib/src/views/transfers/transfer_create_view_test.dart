import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class TransferCreateViewTest extends StatefulWidget {
  final Function(Stock, Stock, Producto, double, double) didSubmitText;

  const TransferCreateViewTest({super.key, required this.didSubmitText});

  @override
  State<TransferCreateViewTest> createState() => _TransferViewCreateTestState();
}

class _TransferViewCreateTestState extends State<TransferCreateViewTest> {
  Note? note;
  Producto? productoDialog;
  Stock? origenDialog;
  Stock? destinoDialog;
  double cantidadCajas = 0;
  double cantidadPiezas = 0;
  List<Stock> origenSeleccionados = [];
  List<Stock> destinoSeleccionados = [];

  bool hasCajasError = false;
  bool hasPiezasError = false;

  final TextEditingController cantidadCajasController = TextEditingController();
  final TextEditingController cantidadPiezasController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateCajas(String? value) {
    if (value!.isEmpty) {
      return null;
    }
    num? cajas = num.tryParse(value);
    if (cajas == null) {
      hasCajasError = true;
      return 'Ingrese un número válido';
    }

    if (origenDialog != null && cajas > origenDialog!.cantidadCajas!.toInt()) {
      hasCajasError = true;
      return 'No hay suficiente stock';
    }

    hasCajasError = false;
    return null;
  }

  String? validatePiezas(String? value) {
    if (value!.isEmpty) {
      return null;
    }
    num? piezas = num.tryParse(value);
    if (piezas == null) {
      hasPiezasError = true;
      return 'Ingrese un número válido';
    }

    if (origenDialog != null &&
        piezas > origenDialog!.cantidadPiezas!.toInt()) {
      hasPiezasError = true;
      return 'No hay suficiente stock';
    }

    hasPiezasError = false;
    return null;
  }

  @override
  void initState() {
    super.initState();

    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    Provider.of<StocksProvider>(context, listen: false).getStocks();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductsProvider>(context).productos;
    final stocks = Provider.of<StocksProvider>(context).stocks;

    final imageWidget = (productoDialog?.img == null)
        ? const Image(image: AssetImage('assets/no-image.jpg'))
        : SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loader.gif',
                image: productoDialog!.img!,
                fit: BoxFit.cover, // ajusta la imagen al contenedor
                width: 200, // establece un ancho máximo
                height: 200, // establece un alto máximo
              ),
            ),
          );

    return Center(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              if (productoDialog != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: imageWidget,
                  ),
                ),
              const SizedBox(height: 10),
              DropdownSearch<Producto>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  showSearchBox: true,
                  // Ajustar esto según sea necesario
                ),
                items:
                    productos, // Asegúrate de que esta lista está definida y llena de objetos Producto
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Producto",
                    hintText: "Seleccione un producto",
                  ),
                ),
                onChanged: (Producto? producto) {
                  setState(() {
                    productoDialog = producto;
                  });
                },
                selectedItem: productoDialog,
                itemAsString: (Producto u) => u.nombre,
                compareFn: (Producto a, Producto b) =>
                    a.nombre == b.nombre, // Función de comparación
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Stock>(
                hint: const Text('Origen'),
                decoration:
                    const InputDecoration(labelText: 'Seleccione origen'),
                value: origenDialog,
                iconSize: 24,
                elevation: 16,
                onChanged: productoDialog != null
                    ? (value) {
                        setState(() {
                          origenSeleccionados.add(value!);
                          origenDialog = value;
                          destinoSeleccionados = destinoSeleccionados
                              .where((d) => d.id != value.id)
                              .toList();
                        });
                      }
                    : null,
                items: stocks
                    .where((stock) => productoDialog == null
                        ? false
                        : stock.producto.id == productoDialog!.id)
                    .where((stock) => !destinoSeleccionados.contains(stock))
                    .map<DropdownMenuItem<Stock>>((Stock value) {
                  return buildStockDropdownMenuItem(
                    value,
                    value == origenDialog,
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<Stock>(
                hint: const Text('Destino'),
                decoration:
                    const InputDecoration(labelText: 'Seleccione destino'),
                value: destinoDialog,
                iconSize: 24,
                elevation: 16,
                onChanged: productoDialog != null
                    ? (value) {
                        setState(() {
                          destinoSeleccionados.add(value!);
                          destinoDialog = value;
                          origenSeleccionados = origenSeleccionados
                              .where((o) => o.id != value.id)
                              .toList();
                        });
                      }
                    : null,
                items: stocks
                    .where((stock) => productoDialog == null
                        ? false
                        : stock.producto.id == productoDialog!.id)
                    .where((stock) => !origenSeleccionados.contains(stock))
                    .map<DropdownMenuItem<Stock>>((Stock value) {
                  return buildStockDropdownMenuItem(
                    value,
                    value == destinoDialog,
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                enabled: productoDialog != null,
                validator: validateCajas,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: origenDialog == null
                        ? "Ingrese cantidad de cajas"
                        : "Valor máximo: ${origenDialog!.cantidadCajas}",
                    labelText: "Ingrese cantidad de cajas"),
                controller: cantidadCajasController,
                onChanged: (value) {
                  cantidadCajas = double.tryParse(value) ?? 0;
                  _formKey.currentState?.validate();
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                enabled: productoDialog != null,
                keyboardType: TextInputType.number,
                validator: validatePiezas,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: origenDialog == null
                        ? "Ingrese cantidad de piezas"
                        : "Valor máximo: ${origenDialog!.cantidadPiezas}",
                    labelText: "Ingrese cantidad de piezas"),
                controller: cantidadPiezasController,
                onChanged: (value) {
                  cantidadPiezas =
                      value.isNotEmpty ? double.tryParse(value) ?? 0 : 0;
                  _formKey.currentState?.validate();
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FxButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Cancelar',
                    buttonType: ButtonType.secondary,
                  ),
                  const SizedBox(width: 20),
                  FxButton(
                    onPressed: () {
                      widget.didSubmitText(destinoDialog!, origenDialog!,
                          productoDialog!, cantidadCajas, cantidadPiezas);
                      Navigator.of(context).pop();
                      print(destinoDialog!);
                    },
                    text: 'Guardar',
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

DropdownMenuItem<Stock> buildStockDropdownMenuItem(
    Stock value, bool isSelected) {
  return DropdownMenuItem<Stock>(
    value: value,
    child: isSelected
        ? Text(value.sucursal.definicion)
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sucursal:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(value.sucursal.definicion),
                const SizedBox(height: 4),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cajas:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(value.cantidadCajas.toString()),
                    ],
                  ),
                  const SizedBox(width: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Unidades:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(value.cantidadPiezas.toString()),
                    ],
                  ),
                ]),
              ],
            ),
          ),
  );
}
