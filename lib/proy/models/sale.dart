// To parse this JSON data, do
//
//     final salesResponse = salesResponseFromMap(jsonString);

import 'dart:convert';

class Venta {
  final String estado;
  final List<_Movimiento> movimientos;
  final String id;
  final _Usuario usuario;
  final _Cotizacion cotizacion;
  final DateTime fechaVenta;

  Venta({
    required this.estado,
    required this.movimientos,
    required this.id,
    required this.usuario,
    required this.cotizacion,
    required this.fechaVenta,
  });

  factory Venta.fromJson(String str) => Venta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venta.fromMap(Map<String, dynamic> json) => Venta(
        estado: json["estado"],
        movimientos: List<_Movimiento>.from(
            json["movimientos"].map((x) => _Movimiento.fromMap(x))),
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        cotizacion: _Cotizacion.fromMap(json["cotizacion"]),
        fechaVenta: DateTime.parse(json["fecha_venta"]),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "movimientos": List<dynamic>.from(movimientos.map((x) => x.toMap())),
        "_id": id,
        "usuario": usuario.toMap(),
        "cotizacion": cotizacion.toMap(),
        "fecha_venta": fechaVenta.toIso8601String(),
      };
}

class _Cotizacion {
  final bool estado;
  final String id;
  final String usuario;
  final String cliente;
  final String nit;
  final String sucursal;
  final DateTime fecha;
  final List<_ProductoElement> productos;
  final int total;
  final int v;

  _Cotizacion({
    required this.estado,
    required this.id,
    required this.usuario,
    required this.cliente,
    required this.nit,
    required this.sucursal,
    required this.fecha,
    required this.productos,
    required this.total,
    required this.v,
  });

  factory _Cotizacion.fromJson(String str) =>
      _Cotizacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Cotizacion.fromMap(Map<String, dynamic> json) => _Cotizacion(
        estado: json["estado"],
        id: json["_id"],
        usuario: json["usuario"],
        cliente: json["cliente"],
        nit: json["nit"],
        sucursal: json["sucursal"],
        fecha: DateTime.parse(json["fecha"]),
        productos: List<_ProductoElement>.from(
            json["productos"].map((x) => _ProductoElement.fromMap(x))),
        total: json["total"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "_id": id,
        "usuario": usuario,
        "cliente": cliente,
        "nit": nit,
        "sucursal": sucursal,
        "fecha": fecha.toIso8601String(),
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
        "total": total,
        "__v": v,
      };
}

class _ProductoElement {
  final String id;
  final _Producto producto;
  final int cantidadCajas;
  final int cantidadPiezas;
  final double precioUnitarioPiezas;
  final int precioUnitarioCajas;
  final int precioTotalPiezas;
  final int precioTotalCajas;
  final int precioTotal;

  _ProductoElement({
    required this.id,
    required this.producto,
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.precioUnitarioPiezas,
    required this.precioUnitarioCajas,
    required this.precioTotalPiezas,
    required this.precioTotalCajas,
    required this.precioTotal,
  });

  factory _ProductoElement.fromJson(String str) =>
      _ProductoElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _ProductoElement.fromMap(Map<String, dynamic> json) =>
      _ProductoElement(
        id: json["_id"],
        producto: _Producto.fromMap(json["producto"]),
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        precioUnitarioPiezas: json["precioUnitarioPiezas"]?.toDouble(),
        precioUnitarioCajas: json["precioUnitarioCajas"],
        precioTotalPiezas: json["precioTotalPiezas"],
        precioTotalCajas: json["precioTotalCajas"],
        precioTotal: json["precioTotal"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "producto": producto.toMap(),
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "precioUnitarioPiezas": precioUnitarioPiezas,
        "precioUnitarioCajas": precioUnitarioCajas,
        "precioTotalPiezas": precioTotalPiezas,
        "precioTotalCajas": precioTotalCajas,
        "precioTotal": precioTotal,
      };
}

class _Producto {
  final bool estado;
  final bool disponible;
  final String color;
  final String id;
  final String nombre;
  final int precioCaja;
  final double precioPorUnidad;
  final String usuario;
  final String categoria;
  final int v;
  final String img;

  _Producto({
    required this.estado,
    required this.disponible,
    required this.color,
    required this.id,
    required this.nombre,
    required this.precioCaja,
    required this.precioPorUnidad,
    required this.usuario,
    required this.categoria,
    required this.v,
    required this.img,
  });

  factory _Producto.fromJson(String str) => _Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Producto.fromMap(Map<String, dynamic> json) => _Producto(
        estado: json["estado"],
        disponible: json["disponible"],
        color: json["color"],
        id: json["_id"],
        nombre: json["nombre"],
        precioCaja: json["precioCaja"],
        precioPorUnidad: json["precioPorUnidad"]?.toDouble(),
        usuario: json["usuario"],
        categoria: json["categoria"],
        v: json["__v"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "disponible": disponible,
        "color": color,
        "_id": id,
        "nombre": nombre,
        "precioCaja": precioCaja,
        "precioPorUnidad": precioPorUnidad,
        "usuario": usuario,
        "categoria": categoria,
        "__v": v,
        "img": img,
      };
}

class _Movimiento {
  final bool estado;
  final int cantidadCajas;
  final int cantidadPiezas;
  final dynamic verificadoPor;
  final dynamic fechaVerificacion;
  final String verificacion;
  final String id;
  final _Usuario usuario;
  final String movimiento;
  final Stock stock;
  final String venta;
  final DateTime fecha;
  final int v;

  _Movimiento({
    required this.estado,
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.verificadoPor,
    required this.fechaVerificacion,
    required this.verificacion,
    required this.id,
    required this.usuario,
    required this.movimiento,
    required this.stock,
    required this.venta,
    required this.fecha,
    required this.v,
  });

  factory _Movimiento.fromJson(String str) =>
      _Movimiento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Movimiento.fromMap(Map<String, dynamic> json) => _Movimiento(
        estado: json["estado"],
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        verificadoPor: json["verificado_por"],
        fechaVerificacion: json["fecha_verificacion"],
        verificacion: json["verificacion"],
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        movimiento: json["movimiento"],
        stock: Stock.fromMap(json["stock"]),
        venta: json["venta"],
        fecha: DateTime.parse(json["fecha"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "verificado_por": verificadoPor,
        "fecha_verificacion": fechaVerificacion,
        "verificacion": verificacion,
        "_id": id,
        "usuario": usuario.toMap(),
        "movimiento": movimiento,
        "stock": stock.toMap(),
        "venta": venta,
        "fecha": fecha.toIso8601String(),
        "__v": v,
      };
}

class Stock {
  final int cantidadCajas;
  final int cantidadPiezas;
  final int reservadoCajas;
  final int reservadoPiezas;
  final String id;
  final _Producto producto;
  final String sucursal;
  final DateTime fecha;
  final List<dynamic> historial;
  final int v;

  Stock({
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.reservadoCajas,
    required this.reservadoPiezas,
    required this.id,
    required this.producto,
    required this.sucursal,
    required this.fecha,
    required this.historial,
    required this.v,
  });

  factory Stock.fromJson(String str) => Stock.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        reservadoCajas: json["reservadoCajas"],
        reservadoPiezas: json["reservadoPiezas"],
        id: json["_id"],
        producto: _Producto.fromMap(json["producto"]),
        sucursal: json["sucursal"],
        fecha: DateTime.parse(json["fecha"]),
        historial: List<dynamic>.from(json["historial"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "reservadoCajas": reservadoCajas,
        "reservadoPiezas": reservadoPiezas,
        "_id": id,
        "producto": producto.toMap(),
        "sucursal": sucursal,
        "fecha": fecha.toIso8601String(),
        "historial": List<dynamic>.from(historial.map((x) => x)),
        "__v": v,
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
