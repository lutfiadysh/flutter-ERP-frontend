import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/users_response.dart';
import 'package:admin_dashboard/proy/models/user.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumndIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    //TODO: peticion http
    final resp = await BackendApi.httpGet('/usuarios?limite=10&desde=0');
    final userResp = UsersResponse.fromMap(resp);
    users = [...userResp.usuarios];

    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final resp = await BackendApi.httpGet('/usuarios/$uid');
      print(resp);

      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future register(
      String email, String password, String name, String role) async {
    // ignore: todo
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
      'rol': role
    };

    print(data);

    try {
      final resp = await BackendApi.post('/usuarios', data);

      final newUser = Usuario.fromMap(resp);

      users.add(newUser);

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future deleteUser(String uid) async {
    try {
      await BackendApi.delete('/usuarios/$uid', {});

      users.removeWhere((user) => user.uid == uid);

      notifyListeners();
    } catch (e) {
      throw ('Error en eliminar categoria');
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }

  
}
