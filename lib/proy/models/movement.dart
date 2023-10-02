import 'dart:convert';

class Movimiento {
  Movimiento({
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.verificacion,
    required this.id,
    required this.stock,
    required this.usuario,
    this.verificadoPor,
    required this.movimiento,
    required this.fecha,
    this.fecha_verificacion,
  });

  int cantidadCajas;
  int cantidadPiezas;
  String verificacion;
  String id;
  _Stock stock;
  _Usuario usuario;
  _Usuario? verificadoPor;
  String movimiento;
  DateTime fecha;
  DateTime? fecha_verificacion;

  factory Movimiento.fromJson(String str) =>
      Movimiento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movimiento.fromMap(Map<String, dynamic> json) => Movimiento(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        verificacion: json["verificacion"],
        id: json["_id"],
        stock: _Stock.fromMap(json["stock"]),
        usuario: _Usuario.fromMap(json["usuario"]),
        verificadoPor: json["verificado_por"] == null
            ? null
            : _Usuario.fromMap(json["verificado_por"]),
        movimiento: json["movimiento"],
        fecha: DateTime.parse(json["fecha"]),
        fecha_verificacion: json["fecha_verificacion"] == null
            ? null
            : DateTime.parse(json["fecha_verificacion"]),
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "verificacion": verificacion,
        "_id": id,
        "stock": stock.toMap(),
        "usuario": usuario.toMap(),
        "verificado_por": verificadoPor == null ? null : verificadoPor!.toMap(),
        "movimiento": movimiento,
        "fecha": fecha.toIso8601String(),
        "fecha_verificacion": fecha_verificacion == null
            ? null
            : fecha_verificacion!.toIso8601String(),
      };
}

class _Stock {
  _Stock({
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.id,
    required this.producto,
    required this.sucursal,
    required this.fecha,
    required this.historial,
    required this.v,
  });

  int cantidadCajas;
  int cantidadPiezas;
  String id;
  _Producto producto;
  _Sucursal sucursal;
  DateTime fecha;
  List<dynamic> historial;
  int v;

  factory _Stock.fromJson(String str) => _Stock.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Stock.fromMap(Map<String, dynamic> json) => _Stock(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        id: json["_id"],
        producto: _Producto.fromMap(json["producto"]),
        sucursal: _Sucursal.fromMap(json["sucursal"]),
        fecha: DateTime.parse(json["fecha"]),
        historial: List<dynamic>.from(json["historial"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "_id": id,
        "producto": producto.toMap(),
        "sucursal": sucursal.toMap(),
        "fecha": fecha.toIso8601String(),
        "historial": List<dynamic>.from(historial.map((x) => x)),
        "__v": v,
      };
}

class _Producto {
  _Producto({
    required this.id,
    required this.nombre,
    this.img,
  });

  String id;
  String nombre;
  String? img;

  factory _Producto.fromJson(String str) => _Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Producto.fromMap(Map<String, dynamic> json) => _Producto(
        id: json["_id"],
        nombre: json["nombre"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "img": img,
      };
}

class _Usuario {
  _Usuario({required this.id, required this.nombre, this.img});

  String id;
  String nombre;
  String? img;

  factory _Usuario.fromJson(String str) => _Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "img": img,
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
