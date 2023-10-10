import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/reserves_response.dart';
import 'package:admin_dashboard/proy/models/reserve.dart';
import 'package:flutter/material.dart';

class ReservesProvider extends ChangeNotifier {
  List<Reserva> reservas = [];
  Reserva? reserva;

  Future getReserves() async {
    try {
      final resp = await BackendApi.httpGet('/pedidos/reservados');
      final reserveResp = ReservesResponse.fromMap(resp);

      reservas = [...reserveResp.reservas];

      notifyListeners();
    } catch (e) {
      // Podrías hacer algo más aquí, como mostrar un mensaje de error al usuario
      notifyListeners(); // Si quieres refrescar el UI incluso cuando ocurra un error
    }
  }
}
