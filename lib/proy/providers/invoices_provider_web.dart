import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/invoices_response.dart';
import 'package:admin_dashboard/proy/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;

class InvoicesProvider extends ChangeNotifier {
  List<Factura> facturas = [];

  Future<void> getInvoices() async {
    final resp = await BackendApi.httpGet('/facturas');
    final invoicesResponse = InvoicesResponse.fromMap(resp);
    facturas = [...invoicesResponse.facturas];
    notifyListeners();
  }

  Future<Factura> getInvoiceById(String id) async {
    try {
      final resp = await BackendApi.httpGet('/facturas/$id');
      final facturaResponse = Factura.fromMap(resp);
      return facturaResponse;
    } catch (e) {
      throw ('Error al obtener factura');
    }
  }

  Future<Factura> createInvoice(String ventaId) async {
    try {
      final Map<String, dynamic> data = {
        'ventaId': ventaId,
      };
      final resp = await BackendApi.post('/facturas', data);
      print(resp);
      final facturaResponse = Factura.fromMap(resp);
      facturas.add(facturaResponse);
      notifyListeners();
      return facturaResponse;
    } catch (e) {
      throw ('Error al crear factura $e');
    }
  }

  Future<void> createPdfInvoice(Factura factura) async {
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

    final pdf = pdfWidgets.Document(
      theme: myTheme,
    );

    pdf.addPage(
      pdfWidgets.Page(
        pageFormat: PdfPageFormat.letter,
        margin: const pdfWidgets.EdgeInsets.all(5),
        build: (context) => pdfWidgets.Padding(
          padding: const pdfWidgets.EdgeInsets.all(5.0),
          child: buildPage(context, factura),
        ),
      ),
    );

    final pdfData = await pdf.save();

    final blob = html.Blob([pdfData], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "${factura.id}.pdf")
      ..click();
  }

  pdfWidgets.Widget buildPage(
    pdfWidgets.Context context,
    Factura factura,
  ) {
    return pdfWidgets.Padding(
      padding: const pdfWidgets.EdgeInsets.all(10), // Margen de 10px
      child: pdfWidgets.Column(
        crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
        children: [
          buildHeader(factura),
          pdfWidgets.SizedBox(height: 10),
          buildCreditFiscalText(),
          pdfWidgets.SizedBox(height: 10),
          buildClientDetails(factura),
          pdfWidgets.SizedBox(height: 10),
          buildProductsTable(factura),
          pdfWidgets.SizedBox(height: 10),
          buildTotal(factura),
          pdfWidgets.SizedBox(height: 20),
          buildQR(factura),
          pdfWidgets.Expanded(child: pdfWidgets.SizedBox()),
          buildFooter(),
        ],
      ),
    );
  }

  pdfWidgets.Widget buildHeader(Factura factura) {
    return pdfWidgets.Row(
      mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
      children: [
        pdfWidgets.Column(
          crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
          children: [
            pdfWidgets.Text(factura.razonSocialEmisor,
                style: const pdfWidgets.TextStyle(fontSize: 10)),
            pdfWidgets.Text('SUCURSAL N. ${factura.codigoSucursal}',
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text(
                'No. Punto de Venta ${factura.codigoDocumentoSector}',
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text(factura.direccion,
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text('Teléfono: 2 2820992',
                style: const pdfWidgets.TextStyle(fontSize: 8)),
            pdfWidgets.Text(factura.municipio,
                style: const pdfWidgets.TextStyle(fontSize: 8)),
          ],
        ),
        pdfWidgets.Table(
          border: pdfWidgets.TableBorder.all(
            color: PdfColors.white,
          ),
          columnWidths: {
            0: const pdfWidgets.FixedColumnWidth(70),
            1: const pdfWidgets.FixedColumnWidth(100),
          },
          children: [
            buildTableRow('NIT:', factura.nitEmisor),
            buildTableRow('FACTURA N°:', factura.numeroFactura.toString()),
            buildTableRow('CÓD. AUTORIZACIÓN:', factura.cuf),
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
          'FACTURA',
          textAlign: pdfWidgets.TextAlign.center,
          style: const pdfWidgets.TextStyle(fontSize: 16),
        ),
        pdfWidgets.Text(
          'Crédito Fiscal',
          textAlign: pdfWidgets.TextAlign.center,
          style: const pdfWidgets.TextStyle(fontSize: 8),
        ),
      ]),
    );
  }

  pdfWidgets.Widget buildClientDetails(Factura factura) {
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
              buildTableRow('Fecha:',
                  DateFormat('dd/MM/yyyy').format(factura.fechaEmision)),
              buildTableRow('Nombre/Razón Social:', factura.nombreRazonSocial),
            ],
          ),
          // Tabla para el NIT y el Código del Cliente
          pdfWidgets.Table(
            border: pdfWidgets.TableBorder.all(
              color: PdfColors.white,
            ),
            children: [
              buildTableRow('NIT/CI:', factura.nitEmisor),
              buildTableRow('Cod. Cliente:', factura.codigoCliente),
            ],
          ),
        ],
      ),
    );
  }

  pdfWidgets.Widget buildProductsTable(Factura factura) {
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
            buildCenteredCell('CÓDIGO'),
            buildCenteredCell('PRODUCTO / SERVICIO'),
            buildCenteredCell('CANTIDAD'),
            buildCenteredCell('UNIDAD DE MEDIDA'),
            buildCenteredCell('DESCRIPCIÓN'),
            buildCenteredCell('PRECIO UNITARIO'),
            buildCenteredCell('DESCUENTO'),
            buildCenteredCell('SUBTOTAL'),
          ],
        ),
        ...factura.detalles
            .map((detalle) => pdfWidgets.TableRow(
                  children: [
                    buildCenteredCell(detalle.codigoProducto),
                    buildCenteredCell(detalle.productoNombre),
                    buildCenteredCell(detalle.cantidad.toString()),
                    buildCenteredCell(
                        detalle.unidadMedida == 1 ? 'Cajas' : 'Piezas'),
                    buildCenteredCell(detalle.descripcion),
                    buildCenteredCell(detalle.precioUnitario.toString()),
                    buildCenteredCell(detalle.montoDescuento.toString()),
                    buildCenteredCell(detalle.subTotal.toString()),
                  ],
                ))
            .toList(),
      ],
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

  pdfWidgets.Widget buildTotal(Factura factura) {
    String montoEnPalabras = convertirNumeroAPalabras(factura.montoTotal);
    montoEnPalabras =
        "${montoEnPalabras[0].toUpperCase()}${montoEnPalabras.substring(1)}";

    return pdfWidgets.Row(
      mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
      children: [
        pdfWidgets.Column(
          crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
          children: [
            pdfWidgets.Text('Son: $montoEnPalabras Bolivianos.',
                style: const pdfWidgets.TextStyle(fontSize: 10)),
          ],
        ),
        pdfWidgets.Table(
          border: pdfWidgets.TableBorder.all(
            color: PdfColors.white,
          ),
          children: [
            buildTableRow(
                'SUBTOTAL Bs:', factura.montoTotalSujetoIva.toStringAsFixed(2)),
            buildTableRow('DESCUENTO Bs:', '0.00'),
            buildTableRow('TOTAL Bs:', factura.montoTotal.toStringAsFixed(2)),
            buildTableRow('MONTO GIFT CARD Bs:', '0.00'),
            buildTableRow(
                'MONTO A PAGAR Bs:', factura.montoTotal.toStringAsFixed(2)),
            buildTableRow('IMPORTE BASE CRÉDITO FISCAL:',
                factura.montoTotalSujetoIva.toStringAsFixed(2)),
          ],
        ),
      ],
    );
  }

  pdfWidgets.Widget buildQR(Factura factura) {
    return pdfWidgets.Row(
      mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
      children: [
        pdfWidgets.Expanded(
          flex: 3,
          child: pdfWidgets.Column(
            crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
            children: [
              pdfWidgets.Text('"${factura.leyenda}"',
                  style: const pdfWidgets.TextStyle(fontSize: 10)),
            ],
          ),
        ),
        pdfWidgets.Expanded(
          flex: 1,
          child: pdfWidgets.Column(
            crossAxisAlignment: pdfWidgets.CrossAxisAlignment.end,
            children: [
              pdfWidgets.Container(
                width: 100,
                height: 100,
                child: pdfWidgets.BarcodeWidget(
                  barcode: pdfWidgets.Barcode.qrCode(),
                  data:
                      "https://pilotosiat.impuestos.gob.bo/consulta/QR?nit=${factura.nitEmisor}&cuf=${factura.cuf}&numero=${factura.numeroFactura}&t=2",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  pdfWidgets.Widget buildFooter() {
    return pdfWidgets.Center(child: pdfWidgets.Text('Gracias por su compra'));
  }

  String convertirNumeroAPalabras(int numero) {
    if (numero == 0) {
      return 'cero';
    }

    final unidades = [
      '',
      'uno',
      'dos',
      'tres',
      'cuatro',
      'cinco',
      'seis',
      'siete',
      'ocho',
      'nueve',
      'diez',
      'once',
      'doce',
      'trece',
      'catorce',
      'quince',
      'dieciséis',
      'diecisiete',
      'dieciocho',
      'diecinueve'
    ];

    final decenas = [
      '',
      '',
      'veinte',
      'treinta',
      'cuarenta',
      'cincuenta',
      'sesenta',
      'setenta',
      'ochenta',
      'noventa'
    ];

    final centenas = [
      '',
      'cien',
      'doscientos',
      'trescientos',
      'cuatrocientos',
      'quinientos',
      'seiscientos',
      'setecientos',
      'ochocientos',
      'novecientos'
    ];

    String palabras = '';

    if ((numero / 100000).floor() > 0) {
      palabras += '${unidades[(numero / 100000).floor()]} cien mil ';
      numero %= 100000;
    }

    if ((numero / 1000).floor() > 0) {
      palabras += '${unidades[(numero / 1000).floor()]} mil ';
      numero %= 1000;
    }

    if ((numero / 100).floor() > 0) {
      palabras += '${centenas[(numero / 100).floor()]} ';
      numero %= 100;
    }

    if (numero > 0) {
      if (numero < 20) {
        palabras += '${unidades[numero]} ';
      } else {
        palabras += '${decenas[(numero / 10).floor()]} ';
        if ((numero % 10) > 0) {
          palabras += 'y ${unidades[numero % 10]} ';
        }
      }
    }

    return palabras.trim();
  }
}
