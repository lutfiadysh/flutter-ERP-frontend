import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/transfer_response.dart';
import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/models/transfer.dart';
import 'package:flutter/material.dart';

class TransfersProvider extends ChangeNotifier {
  List<Traspaso> traspasos = [];

  getTransfers() async {
    final resp = await BackendApi.httpGet('/traspasos');
    final transfersResp = TransferResponse.fromMap(resp);

    traspasos = [...transfersResp.traspasos];

    notifyListeners();
  }

  Future newTransfer(List<Note> list) async {
    final list2 = Note.getListMapAux(list);

    final data = {'productos': list2};

    try {
      final json = await BackendApi.postAux('/traspasos', data);
      final newTransfer = Traspaso.fromMap(json);
      traspasos.add(newTransfer);
      notifyListeners();
    } catch (e) {
      throw ('Error en crear traspaso');
    }
  }
}
