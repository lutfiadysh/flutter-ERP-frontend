import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/listings_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import '../models/listing.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'dart:html' as html;

class ListingsProvider extends ChangeNotifier {
  List<Cotizacion> cotizaciones = [];
  Cotizacion? cotizacion;
  Cotizacion? selectedCotizacion;

  Future<void> getListings() async {
    final resp = await BackendApi.httpGet('/cotizaciones');
    final listingsResp = ListingsResponse.fromMap(resp);

    cotizaciones = [...listingsResp.cotizaciones];

    notifyListeners();
  }

  void selectCotizacion(Cotizacion cotizacion) {
    selectedCotizacion = cotizacion;
    notifyListeners();
  }

  void deselectCotizacion() {
    selectedCotizacion = null;
    notifyListeners();
  }

  Future<void> newListing(List<ProductoElement> productos, String nombreCliente,
      String? nit, String? ci, String? cliente, String? telefono) async {
    final Map<String, dynamic> data = {
      'clienteNombre': nombreCliente,
      'clienteId': cliente,
      'productos': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
          'cantidadPiezas': producto.cantidadPiezas,
          'precioUnitarioPiezas': producto.precioUnitarioPiezas,
          'precioUnitarioCajas': producto.precioUnitarioCajas,
          'precioTotalPiezas': producto.precioTotalPiezas,
          'precioTotalCajas': producto.precioTotalCajas,
          'precioTotal': producto.precioTotal,
        };
      }).toList(),
    };

    if (nit != null && nit.isNotEmpty) {
      data['nit'] = nit;
    }

    if (ci != null && ci.isNotEmpty) {
      data['ci'] = ci;
    }

    if (telefono != null && telefono.isNotEmpty) {
      data['telefono'] = telefono;
    }

    print(data);

    try {
      final resp = await BackendApi.postAux('/cotizaciones', data);
      print(resp.toString());
      final Cotizacion newListing = Cotizacion.fromMap(resp);
      print(newListing);
      cotizaciones.add(newListing);
      notifyListeners();
    } catch (e) {
      throw Exception('Error en crear cotizacion $e');
    }
  }

  Future updateListing(
    String id,
    List<ProductoElement> productos,
  ) async {
    final Map<String, dynamic> data = {
      'productos': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
          'cantidadPiezas': producto.cantidadPiezas,
          'precioUnitarioPiezas': producto.precioUnitarioPiezas,
          'precioUnitarioCajas': producto.precioUnitarioCajas,
          'precioTotalPiezas': producto.precioTotalPiezas,
          'precioTotalCajas': producto.precioTotalCajas,
          'precioTotal': producto.precioTotal,
        };
      }).toList(),
    };
    print(data);
    try {
      await BackendApi.putAux('/cotizaciones/$id', data);

      cotizaciones = cotizaciones.map((cotizacion) {
        if (cotizacion.id == id) {
          cotizacion.productos = productos;
        }
        return cotizacion;
      }).toList();

      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception('Error en actualizar cotizacion');
    }
  }

  Future<void> createReserve(
      List<ProductoElement> productos,
      String nombreCliente,
      String? nit,
      String? ci,
      String? cliente,
      String? telefono) async {
    final Map<String, dynamic> data = {
      'clienteNombre': nombreCliente,
      'clienteId': cliente,
      'productos': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
          'cantidadPiezas': producto.cantidadPiezas,
          'precioUnitarioPiezas': producto.precioUnitarioPiezas,
          'precioUnitarioCajas': producto.precioUnitarioCajas,
          'precioTotalPiezas': producto.precioTotalPiezas,
          'precioTotalCajas': producto.precioTotalCajas,
          'precioTotal': producto.precioTotal,
        };
      }).toList(),
    };

    if (nit != null && nit.isNotEmpty) {
      data['nit'] = nit;
    }

    if (ci != null && ci.isNotEmpty) {
      data['ci'] = ci;
    }

    if (telefono != null && telefono.isNotEmpty) {
      data['telefono'] = telefono;
    }

    try {
      final resp = await BackendApi.postAux('/cotizaciones/reservar', data);
      final Cotizacion newListing = Cotizacion.fromMap(resp);
      cotizaciones.add(newListing);
      notifyListeners();
    } catch (e) {
      throw Exception('Error en crear cotizacion $e');
    }
  }

  Future<void> createPdf(Cotizacion cotizacion) async {
    final pdf = pdfWidgets.Document();

    pdf.addPage(
      pdfWidgets.Page(
        pageFormat: PdfPageFormat.letter,
        build: (context) => pdfWidgets.Padding(
          padding: pdfWidgets.EdgeInsets.all(5.0),
          child: buildPage(context, cotizacion),
        ),
      ),
    );

    final pdfData = await pdf.save();
    final blob = html.Blob([pdfData], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "cotizacion.pdf")
      ..click();
  }

  pdfWidgets.Widget buildPage(
      pdfWidgets.Context context, Cotizacion cotizacion) {
    return pdfWidgets.Column(
      children: [
        buildHeader(cotizacion),
        buildDetails(cotizacion),
        buildProductsTable(cotizacion),
        buildTotal(cotizacion),
        pdfWidgets.Expanded(child: pdfWidgets.SizedBox()),
        buildFooter(),
      ],
    );
  }

  pdfWidgets.Widget buildHeader(Cotizacion cotizacion) {
    return pdfWidgets.Row(
      mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
      children: [
        pdfWidgets.Text('Cotización',
            style: pdfWidgets.TextStyle(
                fontSize: 20, fontWeight: pdfWidgets.FontWeight.bold)),
        pdfWidgets.BarcodeWidget(
          data: cotizacion.id,
          barcode: pdfWidgets.Barcode.qrCode(),
          width: 80,
          height: 80,
        ),
      ],
    );
  }

  pdfWidgets.Widget buildDetails(Cotizacion cotizacion) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    final String formattedDate = dateFormatter.format(cotizacion.fecha);

    return pdfWidgets.Column(
      crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
      children: [
        pdfWidgets.SizedBox(height: 20),
        pdfWidgets.Row(
          mainAxisAlignment: pdfWidgets.MainAxisAlignment.spaceBetween,
          children: [
            pdfWidgets.Text('Fecha: $formattedDate'),
          ],
        ),
        pdfWidgets.SizedBox(height: 20),
        pdfWidgets.Text('Vendedor: ${cotizacion.usuario.nombre}'),
        pdfWidgets.Text('Cliente: ${cotizacion.cliente}'),
        pdfWidgets.Divider(),
      ],
    );
  }

  pdfWidgets.Widget buildProductsTable(Cotizacion cotizacion) {
    return pdfWidgets.Table(
      border: const pdfWidgets.TableBorder(
        bottom: pdfWidgets.BorderSide(
          color: PdfColors.grey,
          width: 1,
        ),
        horizontalInside: pdfWidgets.BorderSide(
          color: PdfColors.grey,
          width: 1,
        ),
        verticalInside: pdfWidgets.BorderSide(
          color: PdfColors.grey,
          width: 1,
        ),
      ),
      children: [
        pdfWidgets.TableRow(
          decoration: const pdfWidgets.BoxDecoration(
            color: PdfColors.grey300,
          ),
          children: [
            buildTableHeader('Producto'),
            buildTableHeader('Cajas'),
            buildTableHeader('Piezas'),
            buildTableHeader('Precio Caja'),
            buildTableHeader('Precio Pieza'),
            buildTableHeader('Subtotal'),
            buildTableHeader('Diferencia %'),
          ],
        ),
        ...buildTableData(cotizacion).map(
          (item) => pdfWidgets.TableRow(
            children: item.map((entry) => buildTableCell(entry)).toList(),
          ),
        ),
      ],
    );
  }

  List<List<String>> buildTableData(Cotizacion cotizacion) {
    return List<List<String>>.generate(
      cotizacion.productos.length,
      (index) => [
        cotizacion.productos[index].producto!.nombre,
        cotizacion.productos[index].cantidadCajas.toString(),
        cotizacion.productos[index].cantidadPiezas.toString(),
        'Bs. ${cotizacion.productos[index].precioUnitarioCajas.toStringAsFixed(2)}',
        'Bs. ${cotizacion.productos[index].precioUnitarioPiezas.toStringAsFixed(2)}',
        'Bs. ${calculateSubtotal(cotizacion.productos[index]).toStringAsFixed(2)}',
        '${calculateDifferentialPercentage(cotizacion.productos[index]).toStringAsFixed(2)}%',
      ],
    );
  }

  pdfWidgets.Widget buildTableHeader(String text) {
    return pdfWidgets.Container(
      alignment: pdfWidgets.Alignment.center,
      margin: pdfWidgets.EdgeInsets.all(5),
      child: pdfWidgets.Text(
        text,
        style: pdfWidgets.TextStyle(
          fontSize: 10,
          fontWeight: pdfWidgets.FontWeight.bold,
        ),
      ),
    );
  }

  pdfWidgets.Widget buildTableCell(String text) {
    return pdfWidgets.Container(
      alignment: pdfWidgets.Alignment.centerLeft,
      margin: pdfWidgets.EdgeInsets.all(5),
      child: pdfWidgets.Text(
        text,
        style: pdfWidgets.TextStyle(
          fontSize: 8,
        ),
      ),
    );
  }

  double calculateSubtotal(ProductoElement producto) {
    double subtotal = producto.precioUnitarioCajas * producto.cantidadCajas +
        producto.precioUnitarioPiezas * producto.cantidadPiezas;
    return double.parse(subtotal.toStringAsFixed(2));
  }

  double calculateDifferentialPercentage(ProductoElement producto) {
    double diffPercentageCajas =
        (producto.producto!.precioCaja! - producto.precioUnitarioCajas) /
            producto.producto!.precioCaja! *
            100;
    double diffPercentagePiezas =
        (producto.producto!.precioPorUnidad! - producto.precioUnitarioPiezas) /
            producto.producto!.precioPorUnidad! *
            100;
    double diffPercentage = (diffPercentageCajas + diffPercentagePiezas) / 2.0;
    return double.parse(diffPercentage.toStringAsFixed(2));
  }

  pdfWidgets.Widget buildTotal(Cotizacion cotizacion) {
    return pdfWidgets.Align(
      alignment: pdfWidgets.Alignment.centerRight,
      child: pdfWidgets.Text('Total: ${cotizacion.total.toString()}'),
    );
  }

  pdfWidgets.Widget buildFooter() {
    return pdfWidgets.Column(
      children: [
        pdfWidgets.Divider(),
        pdfWidgets.SizedBox(height: 5),
        pdfWidgets.Text(
          'Nota: La duración de esta cotización es de 5 días desde la fecha de su emisión.',
        ),
      ],
    );
  }
}
