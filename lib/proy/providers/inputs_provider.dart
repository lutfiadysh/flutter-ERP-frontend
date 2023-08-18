import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/inputs_response.dart';
import 'package:admin_dashboard/proy/models/input.dart';
import 'package:flutter/material.dart';

class InputsProvider extends ChangeNotifier {
  List<Entrada> entradas = [];

  getInputs() async {
    final resp = await BackendApi.httpGet('/entradas');
    final inputsResp = InputsResponse.fromMap(resp);

    entradas = [...inputsResp.entradas];

    notifyListeners();
  }

  Future newInput(
      String stock, double? cantidadCajas, double? cantidadPiezas) async {
    final data = {
      'stock': stock,
      'cantidadCajas': cantidadCajas,
      'cantidadPiezas': cantidadPiezas,
    };

    try {
      final json = await BackendApi.post('/entradas', data);
      final newInput = Entrada.fromMap(json);

      entradas.add(newInput);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  
}
