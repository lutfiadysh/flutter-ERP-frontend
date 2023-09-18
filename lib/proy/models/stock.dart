import 'dart:convert';

import 'product.dart';

class Stock {
  Stock(
      {this.cantidadCajas,
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
      this.estadisticasMensuales});

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
        id: json["_id"],
        cantidad: json["cantidad"],
        producto: Producto.fromMap(json["producto"]),
        sucursal: _Sucursal.fromMap(json["sucursal"]),
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

class _Sucursal {
  _Sucursal({
    required this.id,
    required this.municipio,
  });

  String id;
  String municipio;

  factory _Sucursal.fromJson(String str) => _Sucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Sucursal.fromMap(Map<String, dynamic> json) => _Sucursal(
        id: json["_id"],
        municipio: json["municipio"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "municipio": municipio,
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
