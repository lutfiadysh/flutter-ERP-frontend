// To parse this JSON data, do
//
//     final salesResponse = salesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/movement.dart';

class Venta {
  Venta({
    required this.estado,
    required this.movimientos,
    required this.id,
    required this.usuario,
    required this.cotizacion,
    required this.fechaVenta,
    required this.facturado,
    this.factura,
  });

  final String estado;
  final List<Movimiento> movimientos;
  final String id;
  final _Usuario usuario;
  final Cotizacion cotizacion;
  final DateTime fechaVenta;
  final bool facturado;
  String? factura;

  factory Venta.fromJson(String str) => Venta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venta.fromMap(Map<String, dynamic> json) => Venta(
        estado: json["estado"],
        movimientos: List<Movimiento>.from(
            json["movimientos"].map((x) => Movimiento.fromMap(x))),
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        cotizacion: Cotizacion.fromMap(json["cotizacion"]),
        fechaVenta: DateTime.parse(json["fecha_venta"]),
        facturado: json["facturado"],
        factura: json["factura"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "movimientos": List<dynamic>.from(movimientos.map((x) => x.toMap())),
        "_id": id,
        "usuario": usuario.toMap(),
        "cotizacion": cotizacion.toMap(),
        "fecha_venta": fechaVenta.toIso8601String(),
        "facturado": facturado,
        "factura": factura,
      };
}

class _Usuario {
  final String id;
  final String nombre;

  _Usuario({
    required this.id,
    required this.nombre,
  });

  factory _Usuario.fromJson(String str) => _Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}
