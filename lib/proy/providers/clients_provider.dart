import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/models/http/clients_response.dart';
import 'package:flutter/material.dart';

class ClientsProvider extends ChangeNotifier {
  List<Cliente> clientes = [];

  Future<List<Cliente>> getClients() async {
    try {
      final resp = await BackendApi.httpGet('/clientes');
      final clientsResp = ClientsResponse.fromMap(resp);
      clientes = clientsResp.clientes;
      notifyListeners();
      return clientes; // Devuelve la lista de clientes
    } catch (error) {
      print('Error al obtener clientes: $error');
      return []; // Devuelve una lista vacía en caso de error
    }
  }

  Future<List<Cliente>> searchClients(String term) async {
    try {
      final resp = await BackendApi.search('/clientes/buscar', {'term': term});

      final clientsResp = ClientsResponse.fromMap(resp);

      clientes = [...clientsResp.clientes];

      notifyListeners();
      return clientes;
    } catch (e) {
      print('Ocurrió un error al buscar los clientes: $e');
      return [];
    }
  }
}
