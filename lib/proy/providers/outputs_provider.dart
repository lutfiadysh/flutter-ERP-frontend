import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/outputs_response.dart';
import 'package:admin_dashboard/proy/models/output.dart';
import 'package:flutter/material.dart';

class OutputsProvider extends ChangeNotifier {
  List<Salida> salidas = [];

  getOutputs() async {
    final resp = await BackendApi.httpGet('/salidas');
    final outputsResp = OutputResponse.fromMap(resp);

    salidas = [...outputsResp.salidas];

    notifyListeners();
  }

  Future newOutput(
      String stock, double? cantidadCajas, double? cantidadPiezas) async {
    final data = {
      'stock': stock,
      'cantidadCajas': cantidadCajas,
      'cantidadPiezas': cantidadPiezas,
    };

    try {
      final json = await BackendApi.post('/salidas', data);
      final newOutput = Salida.fromMap(json);

      salidas.add(newOutput);
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
