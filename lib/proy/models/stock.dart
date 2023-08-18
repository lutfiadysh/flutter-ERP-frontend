import 'dart:convert';

import 'product.dart';

class Stock {
  Stock({
    this.cantidadCajas,
    this.cantidadPiezas,
    this.reservadoCajas,
    this.reservadoPiezas,
    this.entranteCajas,
    this.entrantePiezas,
    required this.id,
    this.cantidad,
    required this.producto,
    required this.sucursal,
    required this.fecha,
  });

  int? cantidadCajas;
  int? cantidadPiezas;
  int? reservadoCajas;
  int? reservadoPiezas;
  int? entranteCajas;
  int? entrantePiezas;
  String id;
  int? cantidad;
  Producto producto;
  _Sucursal sucursal;
  DateTime fecha;

  factory Stock.fromJson(String str) => Stock.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        reservadoCajas: json["reservadoCajas"],
        reservadoPiezas: json["reservadoPiezas"],
        entranteCajas: json["entranteCajas"],
        entrantePiezas: json["entrantePiezas"],
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: Producto.fromMap(json["producto"]),
        sucursal: _Sucursal.fromMap(json["sucursal"]),
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "reservadoCajas": reservadoCajas,
        "reservadoPiezas": reservadoPiezas,
        "entranteCajas": entranteCajas,
        "entrantePiezas": entrantePiezas,
        "_id": id,
        "cantidad": cantidad,
        "producto": producto.toMap(),
        "sucursal": sucursal.toMap(),
        "fecha": fecha.toIso8601String(),
      };
}

class _Sucursal {
  _Sucursal({
    required this.id,
    required this.definicion,
  });

  String id;
  String definicion;

  factory _Sucursal.fromJson(String str) => _Sucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Sucursal.fromMap(Map<String, dynamic> json) => _Sucursal(
        id: json["_id"],
        definicion: json["definicion"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "definicion": definicion,
      };
}
