import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/auth_response.dart';
import 'package:admin_dashboard/proy/services/local_storage.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

enum AuthStatus { checking, authenticated, notauthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  List<Usuario> usuarios = [];

  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // ignore: todo
    final data = {
      'correo': email,
      'password': password,
    };

    BackendApi.post('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);

      BackendApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print(e);
      NotificationsService.showSnackbarError('Usuario/Contraseña no válidos');
    });
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await BackendApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notauthenticated;
    NotificationsService.messengerKey = GlobalKey<ScaffoldMessengerState>();

    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    usuarios = usuarios.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }
}
