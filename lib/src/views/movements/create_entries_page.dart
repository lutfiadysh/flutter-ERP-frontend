import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/inputs_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

class CreateEntriesPage extends StatefulWidget {
  final String productId;
  const CreateEntriesPage({
    super.key,
    required this.productId,
  });

  @override
  State<CreateEntriesPage> createState() => _CreateEntriesPageState();
}

class _CreateEntriesPageState extends State<CreateEntriesPage> {
  Stock? selectedStock;
  TextEditingController qtyBoxController = TextEditingController();
  TextEditingController qtyPcsController = TextEditingController();
  bool isSubit = false;
  @override
  void initState() {
    Provider.of<StocksProvider>(context, listen: false).getStocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputsProvider>(context, listen: false);
    final stocks = Provider.of<StocksProvider>(context)
        .stocks
        .where((element) => element.producto.id == widget.productId)
        .toList();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
          child: Container(
            color: Colors.white,
            child: stocks.isNotEmpty
                ? Column(
                    children: [
                      FxBox.h28,
                      if (stocks.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: DropdownButtonFormField<Stock>(
                            value: selectedStock,
                            iconSize: 24,
                            elevation: 16,
                            decoration: InputDecoration(
                              labelText: 'Sucursal',
                              hintText: 'Seleccione una sucursal',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: ColorConst.blue, width: 2.0),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedStock = value;
                              });
                            },
                            items: stocks
                                .map<DropdownMenuItem<Stock>>(
                                  (Stock value) => DropdownMenuItem<Stock>(
                                    value:
                                        value, // add this property an pass the _value to it
                                    child: Text(
                                      value.sucursal.municipio,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        child: TextFormField(
                          controller: qtyBoxController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Cantidad de Cajas',
                              hintText: 'Ingrese la cantidad de cajas',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: qtyPcsController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Cantidad de Piezas',
                              hintText: 'Ingrese la cantidad de piezas',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      FxBox.h20,
                    ],
                  )
                : const SizedBox(),
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
            onPressed: !isSubit
                ? () async {
                    try {
                      if (selectedStock != null &&
                          qtyBoxController.text.isNotEmpty &&
                          qtyPcsController.text.isNotEmpty) {
                        setState(() {
                          isSubit = true;
                        });
                        await inputProvider
                            .newInput(
                                selectedStock!.id,
                                double.parse(qtyBoxController.text),
                                double.parse(qtyPcsController.text))
                            .then((value) {
                          finishedSuccess();
                        });
                      } else {
                        finishFailure();
                      }
                    } catch (e) {
                      finishFailure();
                    }
                  }
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: ColorConst.primary,
            ),
            child: const Text(
              "Guardar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void finishedSuccess() {
    setState(() {
      isSubit = false;
    });
    NotificationsService.showSnackbar('${Strings.movements} creado!');

    Navigator.of(context).pop();
  }

  void finishFailure() {
    // Navigator.of(context).pop();
    NotificationsService.showSnackbarError(
        'No se pudo guardar el ${Strings.movements}');
  }
}
