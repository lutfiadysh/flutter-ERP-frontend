import 'dart:convert';

import 'branch.dart';

class Usuario {
  Usuario({
    required this.rol,
    required this.estado,
    required this.google,
    required this.nombre,
    required this.correo,
    required this.uid,
    this.img,
    required this.sucursal,
    this.codigoPuntoVenta,
    required this.codigoUsuario,
  });

  String rol;
  bool estado;
  bool google;
  String nombre;
  String correo;
  String uid;
  String? img;
  Branch sucursal;
  String? codigoPuntoVenta;
  String codigoUsuario;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
      rol: json["rol"],
      estado: json["estado"],
      google: json["google"],
      nombre: json["nombre"],
      correo: json["correo"],
      uid: json["uid"],
      img: json["img"],
      codigoPuntoVenta: json["codigoPuntoVenta"],
      codigoUsuario: json["codigoUsuario"],
      sucursal: Branch.fromMap(json["sucursal"]));

  Map<String, dynamic> toMap() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "img": img,
        "codigoPuntoVenta": codigoPuntoVenta,
        "codigoUsuario": codigoUsuario,
        "sucursal": sucursal.toMap()
      };
}
