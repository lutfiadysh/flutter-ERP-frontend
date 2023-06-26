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

  void selectVenta(Venta venta) {
    selectedVenta = venta;
    notifyListeners();
  }

  void deselectVenta() {
    selectedVenta = null;
    notifyListeners();
  }

  Future newSale(String sale) async {
    final data = {
      'cotizacion': sale,
    };
    try {
      await BackendApi.postAux('/ventas', data);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
