import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/transfer_response.dart';
import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/models/transfer.dart';
import 'package:flutter/material.dart';

class TransfersProvider extends ChangeNotifier {
  List<Traspaso> traspasos = [];
  bool isLoading = true; // Indica si los datos están cargando

  /// Obtiene todos los traspasos
  Future<void> getTransfers() async {
    _setLoading(true);
    try {
      final resp = await BackendApi.httpGet('/traspasos');
      final transfersResp = TransferResponse.fromMap(resp);
      traspasos = [...transfersResp.traspasos];
    } catch (e) {
      // Aquí puedes manejar el error, mostrar un mensaje al usuario, etc.
    } finally {
      _setLoading(false);
    }
  }

  /// Crea un nuevo traspaso
  Future<bool> newTransfer(List<Note> list) async {
    final list2 = Note.getListMapAux(list);
    final data = {'productos': list2};

    try {
      final json = await BackendApi.postAux('/traspasos', data);
      final newTransfer = Traspaso.fromMap(json);
      traspasos.add(newTransfer);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Actualiza el estado de carga y notifica a los oyentes
  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
