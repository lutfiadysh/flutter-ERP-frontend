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

  Future registerPay(String id) async {
    final data = {
      'venta': id,
    };

    try {
      BackendApi.put('/ventas/pagar_venta/$id', data);
      ventas = ventas.map((venta) {
        if (venta.id != id) return venta;

        return venta;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
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
