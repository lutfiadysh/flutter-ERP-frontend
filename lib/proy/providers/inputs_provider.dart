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

  /*
  Future newTransfer(List<Note> list) async {
    final list2 = Note.getListMapAux(list);

    for (var i = 0; i < list2.length; i++) {
      //print(list2[i]);
    }

    final data = {'productos': list2};
    //print(data);

    try {
      final json = await BackendApi.postAux('/traspasos', data);
      final newTransfer = Traspaso.fromMap(json);
      traspasos.add(newTransfer);
      notifyListeners();
    } catch (e) {
      print(e);
      throw ('Error en crear traspaso');
    }
  }*/
}
