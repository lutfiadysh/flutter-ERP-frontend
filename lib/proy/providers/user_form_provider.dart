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
    user = new item.Usuario(
      rol: rol ?? this.user!.rol,
      estado: estado ?? this.user!.estado,
      google: google ?? this.user!.google,
      nombre: nombre ?? this.user!.nombre,
      correo: correo ?? this.user!.correo,
      uid: uid ?? this.user!.uid,
      img: img ?? this.user!.img,
      sucursal: sucursal ?? this.user!.sucursal,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      final resp = await BackendApi.put('/usuarios/${user!.uid}', data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<item.Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await BackendApi.uploadFile(path, bytes);
      user = item.Usuario.fromMap(resp);
      notifyListeners();

      return user!;
    } catch (e) {
      print(e);
      throw 'Error en user from provider';
    }
  }
}
