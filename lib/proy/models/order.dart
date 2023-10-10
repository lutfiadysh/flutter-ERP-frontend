import 'dart:convert';

import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:admin_dashboard/proy/models/provider.dart';

class Pedido {
  String id;
  Proveedor proveedor;
  _Usuario creadoPor;
  List<ProductoDetalle> productoDetalles;
  DateTime fecha;
  bool estado;
  bool pedido;
  List<Movimiento>? movimientos;

  Pedido(
      {required this.id,
      required this.proveedor,
      required this.creadoPor,
      required this.productoDetalles,
      required this.fecha,
      required this.estado,
      required this.pedido,
      this.movimientos});

  factory Pedido.fromJson(String str) => Pedido.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pedido.fromMap(Map<String, dynamic> json) => Pedido(
        id: json["_id"],
        proveedor: Proveedor.fromMap(json["proveedor"]),
        creadoPor: _Usuario.fromMap(json["creado_por"]),
        productoDetalles: List<ProductoDetalle>.from(
            json["productoDetalles"].map((x) => ProductoDetalle.fromMap(x))),
        fecha: DateTime.parse(json["fecha"]),
        estado: json["estado"],
        pedido: json["pedido"],
        movimientos: json["movimientos"] == null
            ? []
            : List<Movimiento>.from(
                json["movimientos"].map((x) => Movimiento.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "proveedor": proveedor.toMap(),
        "creado_por": creadoPor.toMap(),
        "productoDetalles":
            List<dynamic>.from(productoDetalles.map((x) => x.toMap())),
        "fecha": fecha.toIso8601String(),
        "estado": estado,
        "pedido": pedido,
        "movimientos": movimientos?.map((x) => x.toMap()).toList(),
      };
}

class ProductoDetalle {
  Producto? producto;
  int cantidadCajas;

  ProductoDetalle({
    this.producto,
    required this.cantidadCajas,
  });

  factory ProductoDetalle.fromJson(String str) =>
      ProductoDetalle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoDetalle.fromMap(Map<String, dynamic> json) => ProductoDetalle(
        producto: Producto.fromMap(json["producto"]),
        cantidadCajas: json["cantidadCajas"],
      );

  Map<String, dynamic> toMap() => {
        "producto": producto!.toMap(),
        "cantidadCajas": cantidadCajas,
      };

  ProductoDetalle copyWith({
    Producto? producto,
    Proveedor? proveedor,
    int? cantidadCajas,
    // Otros campos
  }) {
    return ProductoDetalle(
      producto: producto ?? this.producto,
      cantidadCajas: cantidadCajas ?? this.cantidadCajas,
      // Otros campos
    );
  }
}

class _Usuario {
  _Usuario({
    required this.id,
    required this.nombre,
  });

  String id;
  String nombre;

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
