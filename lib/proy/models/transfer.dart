import 'dart:convert';

class Traspaso {
  Traspaso({
    required this.entradas,
    required this.salidas,
    required this.id,
    required this.usuario,
    required this.fecha,
  });

  List<Movements> entradas;
  List<Movements> salidas;
  String id;
  _Usuario usuario;
  DateTime fecha;

  factory Traspaso.fromJson(String str) => Traspaso.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Traspaso.fromMap(Map<String, dynamic> json) => Traspaso(
        entradas: List<Movements>.from(
            json["entradas"].map((x) => Movements.fromMap(x))),
        salidas: List<Movements>.from(
            json["salidas"].map((x) => Movements.fromMap(x))),
        id: json["_id"],
        usuario: _Usuario.fromMap(json["usuario"]),
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toMap() => {
        "entradas": List<dynamic>.from(entradas.map((x) => x.toMap())),
        "salidas": List<dynamic>.from(salidas.map((x) => x.toMap())),
        "_id": id,
        "usuario": usuario.toMap(),
      };
}

class Movements {
  Movements({
    required this.cantidadCajas,
    required this.cantidadPiezas,
    required this.id,
    required this.stock,
    required this.verificacion,
  });

  int cantidadCajas;
  int cantidadPiezas;
  String id;
  String verificacion;
  _Stock stock;

  factory Movements.fromJson(String str) => Movements.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movements.fromMap(Map<String, dynamic> json) => Movements(
        cantidadCajas: json["cantidadCajas"],
        cantidadPiezas: json["cantidadPiezas"],
        verificacion: json["verificacion"],
        id: json["_id"],
        stock: _Stock.fromMap(json["stock"]),
      );

  Map<String, dynamic> toMap() => {
        "cantidadCajas": cantidadCajas,
        "cantidadPiezas": cantidadPiezas,
        "verificacion": verificacion,
        "_id": id,
        "stock": stock.toMap(),
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
