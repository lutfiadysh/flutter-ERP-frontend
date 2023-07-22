import 'dart:typed_data';

import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/branch.dart';
import 'package:flutter/material.dart';

import '../models/user.dart' as item;

class UserFormProvider extends ChangeNotifier {
  item.Usuario? user;
  late GlobalKey<FormState> formKey;

  copyUserWith(
      {String? rol,
      bool? estado,
      bool? google,
      String? nombre,
      String? correo,
      String? uid,
      String? img,
      Branch? sucursal}) {
    user = item.Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
      sucursal: sucursal ?? user!.sucursal,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future<item.Usuario?> updateUser() async {
    if (!_validForm()) return null;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      print('el usuario es' + user!.uid);

      final resp = await BackendApi.put('/usuarios/${user!.uid}', data);
      print(resp);
      // Aquí, deberías actualizar la información del usuario con la respuesta recibida.
      // Suponiendo que tu API devuelve los detalles del usuario actualizado, actualizas el usuario aquí.
      user = item.Usuario.fromMap(resp);

      notifyListeners();

      // Devuelve el usuario actualizado.
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<item.Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await BackendApi.uploadFile(path, bytes);
      user = item.Usuario.fromMap(resp);
      notifyListeners();

      return user!;
    } catch (e) {
      throw 'Error en user from provider';
    }
  }
}
