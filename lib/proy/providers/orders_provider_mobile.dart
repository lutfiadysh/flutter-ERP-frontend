import 'dart:io';

import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/order_response.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class OrdersProvider extends ChangeNotifier {
  List<Pedido> pedidos = [];
  Pedido? pedido;
  Pedido? selectedPedido;

  Future<void> getOrders() async {
    final resp = await BackendApi.httpGet('/pedidos');
    final ordersResp = OrderResponse.fromMap(resp);

    pedidos = [...ordersResp.pedidos];

    notifyListeners();
  }

  void selectCotizacion(Pedido pedido) {
    selectedPedido = pedido;
    notifyListeners();
  }

  void deselectCotizacion() {
    selectedPedido = null;
    notifyListeners();
  }

  Future<void> newOrder(List<ProductoDetalle> productos) async {
    final Map<String, dynamic> data = {
      'productos': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
        };
      }).toList(),
    };

    try {
      final resp = await BackendApi.postAux('/pedidos', data);
      print(resp);
      final newProviders =
          (resp as List).map((item) => Pedido.fromMap(item)).toList();
      pedidos.addAll(newProviders);
      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido $e');
    }
  }



  Future<void> updateOrder(String id, List<ProductoDetalle> productos) async {
    final Map<String, dynamic> data = {
      'productoDetalles': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
        };
      }).toList(),
    };

    try {
      await BackendApi.putAux('/pedidos/$id', data);

      pedidos = pedidos.map((pedido) {
        if (pedido.id == id) {
          pedido.productoDetalles = productos;
        }
        return pedido;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido $e');
    }
  }

//Crear movimientos para las ordenes y actualizar el estado de pedido

  Future<void> createOrderMovements(String id) async {
    final String url = '/pedidos/crear-movimientos/$id';
    final data = {"pedido": id};

    try {
      final response = await BackendApi.put(url, data);

      // Actualizar la lista de pedidos en el cliente
      pedidos = pedidos.map((pedido) {
        if (pedido.id == id) {
          pedido.movimientos = (response['movimientos'] as List)
              .map((item) => Movimiento.fromMap(item))
              .toList();
        }
        return pedido;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido: $e');
    }
  }

//   Future<void> createPdf(Pedido pedido) async {
  Future deleteProvider(
    String id,
  ) async {
    try {
      await BackendApi.delete('/pedidos/$id', {});

      pedidos.removeWhere((provider) => provider.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> createPdfOrder(Pedido pedido) async {
    // Load font data
    var regularFontData =
        await rootBundle.load("assets/fonts/Nunito-Regular.ttf");
    var boldFontData = await rootBundle.load("assets/fonts/Nunito-Bold.ttf");
    var italicFontData =
        await rootBundle.load("assets/fonts/Nunito-Italic.ttf");
    var boldItalicFontData =
        await rootBundle.load("assets/fonts/Nunito-BoldItalic.ttf");

    var regularFont = pdfWidgets.Font.ttf(regularFontData);
    var boldFont = pdfWidgets.Font.ttf(boldFontData);
    var italicFont = pdfWidgets.Font.ttf(italicFontData);
    var boldItalicFont = pdfWidgets.Font.ttf(boldItalicFontData);

    // Create a theme that uses the loaded fonts
    var myTheme = pdfWidgets.ThemeData.withFont(
      base: regularFont,
      bold: boldFont,
      italic: italicFont,
      boldItalic: boldItalicFont,
    );

    // Determine the path and filename
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/${pedido.id}.pdf';
    final file = File(filePath);

    // Check if the file already exists
    if (await file.exists()) {
      // Open the existing PDF document
      OpenFile.open(filePath);
    } else {
      final pdf = pdfWidgets.Document(
        theme: myTheme,
      );

      pdf.addPage(
        pdfWidgets.Page(
          pageFormat: PdfPageFormat.letter,
          margin: const pdfWidgets.EdgeInsets.all(5),
          build: (context) => pdfWidgets.Padding(
            padding: const pdfWidgets.EdgeInsets.all(5.0),
            child: buildPage(context, pedido),
          ),
        ),
      );

      final pdfData = await pdf.save();

      // Save the PDF document
      await file.writeAsBytes(pdfData);

      // Open the newly created PDF document
      OpenFile.open(filePath);
    }
  }

  pdfWidgets.Widget buildPage(
    pdfWidgets.Context context,
    Pedido pedido,
  ) {
    return pdfWidgets.Padding(
      padding: const pdfWidgets.EdgeInsets.all(10), // Margen de 10px
      child: pdfWidgets.Column(
        crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
        children: [
          buildHeader(pedido),
          pdfWidgets.SizedBox(height: 10),
          buildCreditFiscalText(),
          pdfWidgets.SizedBox(height: 10),
          buildClientDetails(pedido),
          pdfWidgets.SizedBox(height: 10),
          buildProductsTable(pedido),
        ],
      ),
    );
  }

  pdfWidgets.Widget buildHeader(Pedido pedido) {
    return pdfWidgets.Row(
      mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
      children: [
        pdfWidgets.Column(
          crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
          children: [
            pdfWidgets.Text("IMPORTADORA AQUISAN",
                style: const pdfWidgets.TextStyle(fontSize: 10)),
            pdfWidgets.Text("Av 6 de Marzo 2958",
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text('Teléfono: 2 2820992',
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text("El Alto - Bolivia",
                style: const pdfWidgets.TextStyle(fontSize: 8)),
          ],
        ),
      ],
    );
  }

  pdfWidgets.TableRow buildTableRow(String label, String data) {
    return pdfWidgets.TableRow(
      children: [
        pdfWidgets.Padding(
          padding: const pdfWidgets.EdgeInsets.all(2.0),
          child: pdfWidgets.Text(label,
              style: pdfWidgets.TextStyle(
                  fontSize: 8, fontWeight: pdfWidgets.FontWeight.bold)),
        ),
        pdfWidgets.Padding(
          padding: const pdfWidgets.EdgeInsets.all(2.0),
          child: pdfWidgets.Text(data,
              style: const pdfWidgets.TextStyle(fontSize: 8)),
        ),
      ],
    );
  }

  pdfWidgets.Widget buildCreditFiscalText() {
    return pdfWidgets.Center(
      child: pdfWidgets.Column(children: [
        pdfWidgets.Text(
          'ORDEN DE PEDIDO',
          textAlign: pdfWidgets.TextAlign.center,
          style: const pdfWidgets.TextStyle(fontSize: 16),
        ),
        pdfWidgets.Text(
          'Solicitud de Cotización',
          textAlign: pdfWidgets.TextAlign.center,
          style: const pdfWidgets.TextStyle(fontSize: 8),
        ),
      ]),
    );
  }

  pdfWidgets.Widget buildClientDetails(Pedido pedido) {
    return pdfWidgets.Padding(
      padding: const pdfWidgets.EdgeInsets.only(top: 10),
      child: pdfWidgets.Row(
        mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
        children: [
          // Tabla para la Fecha y el Nombre/Razón Social
          pdfWidgets.Table(
            border: pdfWidgets.TableBorder.all(
              color: PdfColors.white,
            ),
            children: [
              buildTableRow(
                  'Fecha:', DateFormat('dd/MM/yyyy').format(pedido.fecha)),
              buildTableRow('Proveedor:', pedido.proveedor.nombre),
            ],
          ),
          // Tabla para el NIT y el Código del Cliente
        ],
      ),
    );
  }

  pdfWidgets.Widget buildCenteredCell(String text) {
    return pdfWidgets.Padding(
      padding: const pdfWidgets.EdgeInsets.all(5.0),
      child: pdfWidgets.Column(
        crossAxisAlignment: pdfWidgets.CrossAxisAlignment.center,
        mainAxisAlignment: pdfWidgets.MainAxisAlignment.center,
        children: [
          pdfWidgets.Text(
            text,
            style: const pdfWidgets.TextStyle(fontSize: 7),
          ),
        ],
      ),
    );
  }

  pdfWidgets.Widget buildProductsTable(Pedido pedido) {
    return pdfWidgets.Table(
      border: pdfWidgets.TableBorder.all(),
      columnWidths: {
        0: const pdfWidgets.FlexColumnWidth(1.5),
        1: const pdfWidgets.FlexColumnWidth(1.1),
        2: const pdfWidgets.FlexColumnWidth(1),
        3: const pdfWidgets.FlexColumnWidth(1),
        4: const pdfWidgets.FlexColumnWidth(3),
        5: const pdfWidgets.FlexColumnWidth(1),
        6: const pdfWidgets.FlexColumnWidth(1.1),
        7: const pdfWidgets.FlexColumnWidth(1),
      },
      children: [
        pdfWidgets.TableRow(
          verticalAlignment: pdfWidgets.TableCellVerticalAlignment.middle,
          children: [
            buildCenteredCell('PRODUCTO'),
            buildCenteredCell('CANTIDAD'),
            buildCenteredCell('UNIDAD DE MEDIDA'),
          ],
        ),
        ...pedido.movimientos!
            .map((movimiento) => pdfWidgets.TableRow(
                  children: [
                    buildCenteredCell(movimiento.stock.producto.nombre),
                    buildCenteredCell(movimiento.cantidadCajas.toString()),
                    buildCenteredCell("Cajas"),
                  ],
                ))
            .toList(),
      ],
    );
  }
}
