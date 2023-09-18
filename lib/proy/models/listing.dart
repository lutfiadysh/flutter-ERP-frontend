import 'dart:convert';

import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/models/product.dart';

class Cotizacion {
  Cotizacion({
    required this.id,
    this.numero,
    required this.usuario,
    required this.cliente,
    required this.sucursal,
    required this.fecha,
    required this.productos,
    required this.total,
    required this.estado,
    required this.vendido,
    this.nit,
  });

  String id;
  String? numero;
  _Usuario usuario;
  Cliente cliente;
  String? nit;
  _Sucursal sucursal;
  DateTime fecha;
  List<ProductoElement> productos;
  double total;
  bool estado;
  bool vendido;

  factory Cotizacion.fromJson(String str) =>
      Cotizacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cotizacion.fromMap(Map<String, dynamic> json) => Cotizacion(
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        cliente: Cliente.fromMap(json["cliente"]),
        sucursal: _Sucursal.fromMap(json["sucursal"]),
        fecha: DateTime.parse(json["fecha"]),
        productos: List<ProductoElement>.from(
            json["productos"].map((x) => ProductoElement.fromMap(x))),
        total: json["total"].toDouble(),
        estado: json["estado"],
        vendido: json["vendido"],
        numero: json["numero"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "usuario": usuario.toMap(),
        "cliente": cliente.toMap(),
        "sucursal": sucursal.toMap(),
        "fecha": fecha.toIso8601String(),
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
        "total": total,
        "estado": estado,
        "vendido": vendido,
        "numero": numero,
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

  ProductoElement copyWith({
    int? cantidadCajas,
    int? cantidadPiezas,
    double? precioUnitarioCajas,
    double? precioUnitarioPiezas,
    double? precioTotalPiezas,
    double? precioTotalCajas,
    double? precioTotal,
  }) {
    return ProductoElement(
      producto: producto!,
      cantidadCajas: cantidadCajas ?? this.cantidadCajas,
      cantidadPiezas: cantidadPiezas ?? this.cantidadPiezas,
      precioUnitarioCajas: precioUnitarioCajas ?? this.precioUnitarioCajas,
      precioUnitarioPiezas: precioUnitarioPiezas ?? this.precioUnitarioPiezas,
      precioTotalPiezas: precioTotalPiezas ??
          this.precioTotalPiezas, // Puedes ajustar esto según sea necesario
      precioTotalCajas: precioTotalCajas ??
          this.precioTotalCajas, // Puedes ajustar esto según sea necesario
      precioTotal: precioTotal ??
          this.precioTotal, // Puedes ajustar esto según sea necesario
    );
  }
}

class _Sucursal {
  String id;
  String municipio;

  _Sucursal({
    required this.id,
    required this.municipio,
  });

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
