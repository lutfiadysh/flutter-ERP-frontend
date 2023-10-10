import 'dart:convert';

import 'package:admin_dashboard/proy/models/product.dart';

class Reserva {
  Producto? producto;
  Sumatoria? sumatoria;

  Reserva({
    required this.producto,
    this.sumatoria,
  });

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) => Reserva(
        producto: Producto.fromMap(json["producto"]),
        sumatoria: Sumatoria.fromMap(json["sumatoria"]),
      );

  Map<String, dynamic> toMap() => {
        "producto": producto!.toMap(),
        "sumatoria": sumatoria!.toMap(),
      };
}

class Sumatoria {
  final int totalCajas;

  Sumatoria({
    required this.totalCajas,
  });

  factory Sumatoria.fromJson(String str) => Sumatoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sumatoria.fromMap(Map<String, dynamic> json) => Sumatoria(
        totalCajas: json["totalCajas"].toInt(),
      );

  Map<String, dynamic> toMap() => {
        "totalCajas": totalCajas,
      };
}
