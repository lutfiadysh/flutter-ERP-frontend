import 'dart:convert';

import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/stock.dart';

class Note {
  Note({
    required this.producto,
    required this.origen,
    required this.destino,
    this.cantidadCajas,
    this.cantidadPiezas,
  });

  Producto producto;
  Stock origen;
  Stock destino;
  double? cantidadCajas;
  double? cantidadPiezas;

  factory Note.fromJson(String str) => Note.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Note.fromMap(Map<String, dynamic> json) => Note(
        producto: Producto.fromMap(json["producto"]),
        destino: Stock.fromMap(json["destino"]),
        origen: Stock.fromMap(json["origen"]),
      );

  Map<String, dynamic> toMap() => {
        "producto": producto.toMap(),
        "origen": origen.toMap(),
        "destino": destino.toMap(),
      };

  Map<String, dynamic> toMapAux() => {
        "producto": producto.id,
        "origen": origen.id,
        "destino": destino.id,
        "cajas": cantidadCajas,
        "piezas": cantidadPiezas,
      };

  static dynamic getListMap(List<dynamic> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> list = [];
    for (var element in items) {
      list.add(element.toMap());
    }
    return list;
  }

  static dynamic getListMapAux(List<dynamic> items) {
    if (items == null) {
      return null;
    }
    List<Map<String, dynamic>> listAux = [];
    for (var element in items) {
      listAux.add(element.toMapAux());
    }
    return listAux;
  }
}
