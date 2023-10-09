import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/providers_response.dart';
import 'package:admin_dashboard/proy/models/provider.dart';
import 'package:flutter/material.dart';

class ProvidersProvider extends ChangeNotifier {
  List<Proveedor> proveedores = [];
  Proveedor? proveedor;

  Future getProviders() async {
    final resp = await BackendApi.httpGet('/proveedores');
    final providersResp = ProvidersResponse.fromMap(resp);

    proveedores = [...providersResp.proveedores];

    notifyListeners();
  }

  Future<List<Proveedor>> getData(String? filter) async {
    try {
      final response = await BackendApi.httpGet('proveedores?filter=$filter');
      final data = response;

      if (data != null) {
        return proveedores;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future newProvider(String name, String? phone, String? email) async {
    final data = {
      'nombre': name,
      'telefono': phone,
      'correo': email,
    };

    try {
      final resp = await BackendApi.post('/proveedores', data);
      final newProvider = Proveedor.fromMap(resp);

      proveedores.add(newProvider);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future updateProvider(
      String id, String name, String? phone, String? email) async {
    final data = {
      'nombre': name,
      'telefono': phone,
      'correo': email,
    };

    try {
      await BackendApi.put('/proveedores/$id', data);

      proveedores = proveedores.map((provider) {
        if (provider.id != id) return provider;

        provider.nombre = name;
        provider.telefono = phone;
        provider.correo = email;
        return provider;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future deleteProvider(
    String id,
  ) async {
    try {
      await BackendApi.delete('/proveedores/$id', {});

      proveedores.removeWhere((provider) => provider.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
