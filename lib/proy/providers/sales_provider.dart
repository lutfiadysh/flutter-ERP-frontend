import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:flutter/material.dart';

class SalesProvider extends ChangeNotifier {
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
