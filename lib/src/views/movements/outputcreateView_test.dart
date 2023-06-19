import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/outputs_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class OutputViewCreateTest extends StatefulWidget {
  const OutputViewCreateTest({super.key});

  @override
  State<OutputViewCreateTest> createState() => _OutputViewCreateTestState();
}

class _OutputViewCreateTestState extends State<OutputViewCreateTest> {
  Note? note;
  Producto? productoDialog;
  Stock? stockDialog;
  double? cantidadCajas;
  double? cantidadPiezas;
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

    if (stockDialog != null && cajas > stockDialog!.cantidadCajas!.toInt()) {
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

    if (stockDialog != null && piezas > stockDialog!.cantidadPiezas!.toInt()) {
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
    final outputProvider = Provider.of<OutputsProvider>(context, listen: false);
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
        width: 300,
        height: productoDialog == null ? 420 : 640,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (productoDialog != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: imageWidget,
                    ),
                  DropdownSearch<Producto>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                      disabledItemFn: (Producto p) => p.nombre
                          .startsWith('I'), // Ajustar esto según sea necesario
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
                  DropdownButtonFormField<Stock>(
                    decoration: const InputDecoration(
                      labelText: 'Origen',
                      hintText: 'Seleccione origen',
                    ),
                    value: stockDialog,
                    iconSize: 24,
                    elevation: 16,
                    onChanged: productoDialog != null
                        ? (value) {
                            setState(() {
                              stockDialog = value;
                            });
                          }
                        : null,
                    items: stocks
                        .where((stock) => productoDialog == null
                            ? false
                            : stock.producto.id == productoDialog!.id)
                        .map<DropdownMenuItem<Stock>>((Stock value) {
                      return buildStockDropdownMenuItem(
                          value, value == stockDialog);
                    }).toList(),
                  ),
                  TextFormField(
                    enabled: productoDialog != null,
                    validator: validateCajas,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Cantidad de Cajas',
                      hintText: stockDialog == null
                          ? "Ingrese cantidad de cajas"
                          : "Valor máximo: ${stockDialog!.cantidadCajas}",
                    ),
                    controller: cantidadCajasController,
                    onChanged: (value) {
                      cantidadCajas = double.tryParse(value);
                      _formKey.currentState?.validate();
                    },
                  ),
                  TextFormField(
                    enabled: productoDialog != null,
                    keyboardType: TextInputType.number,
                    validator: validatePiezas,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Cantidad de Piezas',
                      hintText: stockDialog == null
                          ? "Ingrese cantidad de piezas"
                          : "Valor máximo: ${stockDialog!.cantidadPiezas}",
                    ),
                    controller: cantidadPiezasController,
                    onChanged: (value) {
                      cantidadPiezas = double.tryParse(value);
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await outputProvider.newOutput(
                                stockDialog!.id, cantidadCajas, cantidadPiezas);
                            Navigator.of(context).pop();
                          }
                        },
                        text: 'Guardar',
                      ),
                    ],
                  )
                ],
              ),
            ),
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
        : Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Padding(
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
          ),
  );
}
