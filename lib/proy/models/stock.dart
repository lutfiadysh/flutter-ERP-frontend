import 'dart:convert';

import 'package:admin_dashboard/proy/models/branch.dart';

import 'product.dart';

class Stock {
  Stock(
      {this.cantidadCajas,
      this.cantidadPiezas,
      this.reservadoCajas,
      this.reservadoPiezas,
      this.entranteCajas,
      this.entrantePiezas,
      this.eoq,
      this.puntoReorden,
      required this.id,
      this.cantidad,
      required this.producto,
      required this.sucursal,
      required this.fecha,
      this.estadisticasMensuales});

  int? cantidadCajas;
  int? cantidadPiezas;
  int? reservadoCajas;
  int? reservadoPiezas;
  int? entranteCajas;
  int? entrantePiezas;
  int? eoq;
  int? puntoReorden;
  String id;
  int? cantidad;
  Producto producto;
  Branch sucursal;
  DateTime fecha;
  List<EstadisticasMensuale>? estadisticasMensuales;

  factory Stock.fromJson(String str) => Stock.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        reservadoCajas: json["reservadoCajas"],
        reservadoPiezas: json["reservadoPiezas"],
        entranteCajas: json["entranteCajas"],
        entrantePiezas: json["entrantePiezas"],
        eoq: json["eoq"],
        puntoReorden: json["puntoReorden"],
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: Producto.fromMap(json["producto"]),
        sucursal: Branch.fromMap(json["sucursal"]),
        fecha: DateTime.parse(json["fecha"]),
        estadisticasMensuales: json["estadisticasMensuales"] == null
            ? null
            : List<EstadisticasMensuale>.from(json["estadisticasMensuales"]
                .map((x) => EstadisticasMensuale.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "reservadoCajas": reservadoCajas,
        "reservadoPiezas": reservadoPiezas,
        "entranteCajas": entranteCajas,
        "entrantePiezas": entrantePiezas,
        "eoq": eoq,
        "puntoReorden": puntoReorden,
        "_id": id,
        "cantidad": cantidad,
        "producto": producto.toMap(),
        "sucursal": sucursal.toMap(),
        "fecha": fecha.toIso8601String(),
        "estadisticasMensuales": estadisticasMensuales == null
            ? null
            : List<dynamic>.from(estadisticasMensuales!.map((x) => x.toMap())),
      };
}

class EstadisticasMensuale {
  final String id;
  final int year;
  final int month;
  final int totalCajas;

  EstadisticasMensuale({
    required this.id,
    required this.year,
    required this.month,
    required this.totalCajas,
  });

  factory EstadisticasMensuale.fromJson(String str) =>
      EstadisticasMensuale.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EstadisticasMensuale.fromMap(Map<String, dynamic> json) =>
      EstadisticasMensuale(
        id: json["_id"],
        year: json["year"],
        month: json["month"],
        totalCajas: json["totalCajas"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "year": year,
        "month": month,
        "totalCajas": totalCajas,
      };
}
