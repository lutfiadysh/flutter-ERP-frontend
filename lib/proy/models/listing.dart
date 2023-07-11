import 'dart:convert';

import 'package:admin_dashboard/proy/models/product.dart';

class Cotizacion {
  Cotizacion({
    required this.id,
    required this.numero,
    required this.usuario,
    required this.cliente,
    required this.sucursal,
    required this.fecha,
    required this.productos,
    required this.total,
    required this.estado,
    this.nit,
  });

  String id;
  String numero;
  _Usuario usuario;
  String cliente;
  String? nit;
  _Sucursal sucursal;
  DateTime fecha;
  List<ProductoElement> productos;
  double total;
  bool estado;

  factory Cotizacion.fromJson(String str) =>
      Cotizacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cotizacion.fromMap(Map<String, dynamic> json) => Cotizacion(
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        cliente: json["cliente"],
        nit: json["nit"],
        sucursal: _Sucursal.fromMap(json["sucursal"]),
        fecha: DateTime.parse(json["fecha"]),
        productos: List<ProductoElement>.from(
            json["productos"].map((x) => ProductoElement.fromMap(x))),
        total: json["total"].toDouble(),
        estado: json["estado"],
        numero: '',
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "usuario": usuario.toMap(),
        "cliente": cliente,
        "nit": nit,
        "sucursal": sucursal.toMap(),
        "fecha": fecha.toIso8601String(),
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
        "total": total,
        "estado": estado,
      };
}

class ProductoElement {
  Producto? producto;
  int cantidadCajas;
  int cantidadPiezas;
  double precioUnitarioPiezas;
  double precioUnitarioCajas;
  double precioTotalPiezas;
  double precioTotalCajas;
  double precioTotal;

  ProductoElement(
      {required this.producto,
      required this.cantidadCajas,
      required this.cantidadPiezas,
      required this.precioUnitarioPiezas,
      required this.precioUnitarioCajas,
      required this.precioTotalPiezas,
      required this.precioTotalCajas,
      required this.precioTotal});

  factory ProductoElement.fromJson(String str) =>
      ProductoElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductoElement.fromMap(Map<String, dynamic> json) => ProductoElement(
        producto: Producto.fromMap(json["producto"]),
        cantidadCajas: json["cantidadCajas"] ?? 0,
        cantidadPiezas: json["cantidadPiezas"] ?? 0,
        precioUnitarioPiezas: json["precioUnitarioPiezas"].toDouble(),
        precioUnitarioCajas: json["precioUnitarioCajas"].toDouble(),
        precioTotalPiezas: json["precioTotalPiezas"].toDouble(),
        precioTotalCajas: json["precioTotalCajas"].toDouble(),
        precioTotal: json["precioTotal"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "producto": producto!.toMap(),
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "precioUnitarioPiezas": precioUnitarioPiezas,
        "precioUnitarioCajas": precioUnitarioCajas,
        "precioTotalPiezas": precioTotalPiezas,
        "precioTotalCajas": precioTotalCajas,
        "precioTotal": precioTotal,
      };

  copyWith({required int cantidadCajas, required int cantidadPiezas, required double precioUnitarioCajas, required double precioUnitarioPiezas}) {}
}

class _Sucursal {
  String id;
  String definicion;

  _Sucursal({
    required this.id,
    required this.definicion,
  });

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

class _Usuario {
  String id;
  String nombre;

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
