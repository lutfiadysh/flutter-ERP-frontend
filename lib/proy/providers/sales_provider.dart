import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/sales_response.dart';
import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:flutter/material.dart';

class SalesProvider extends ChangeNotifier {
  List<Venta> ventas = [];

  Venta? venta;
  Venta? selectedVenta;

  Future<void> getSales() async {
    final resp = await BackendApi.httpGet('/ventas');
    final salesResp = SalesResponse.fromMap(resp);

    ventas = [...salesResp.ventas];

    notifyListeners();
  }

  Future<Venta> getSaleById(String id) async {
    final resp = await BackendApi.httpGet('/ventas/$id');
    final sale = Venta.fromMap(resp);
    venta = sale;
    notifyListeners();
    return venta!;
  }

  void selectVenta(Venta venta) {
    selectedVenta = venta;
    notifyListeners();
  }

  void deselectVenta() {
    selectedVenta = null;
    notifyListeners();
  }

  Future<Venta> registerPay(String id) async {
    final data = {'venta': id};

    try {
      final resp = await BackendApi.put('/ventas/pagar_venta/$id', data);
      final sale = Venta.fromMap(resp);
      venta = sale;

      notifyListeners();
      return venta!;
    } catch (e) {
      throw ('Error en el registro de pago');
    }
  }

  Future newSale(String listing) async {
    final data = {
      'cotizacion': listing,
    };
    try {
      final Map<String, dynamic> json =
          await BackendApi.postAux('/ventas', data);

      final Venta newVenta = Venta.fromMap(json);
      ventas.add(newVenta);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
