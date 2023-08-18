import 'dart:convert';

class Producto {
  Producto({
    required this.id,
    required this.nombre,
    required this.usuario,
    required this.categoria,
    this.color,
    required this.disponible,
    this.img,
    this.precioCaja,
    this.precioPorUnidad,
  });

  String id;
  String nombre;
  _Usuario usuario;
  _Categoria categoria;
  String? img;
  String? color;
  bool disponible;
  double? precioCaja;
  double? precioPorUnidad;

  factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        precioCaja: json["precioCaja"].toDouble(),
        precioPorUnidad: json["precioPorUnidad"].toDouble(),
        id: json["_id"],
        nombre: json["nombre"],
        usuario: _Usuario.fromMap(json["usuario"]),
        categoria: _Categoria.fromMap(json["categoria"]),
        img: json["img"],
        color: json["color"],
        disponible: json["disponible"],
      );

  Map<String, dynamic> toMap() => {
        "precioCaja": precioCaja,
        "precioPorUnidad": precioPorUnidad,
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
        "categoria": categoria.toMap(),
        "img": img,
        "color": color,
        "disponible": disponible,
      };

  @override
  String toString() {
    return 'Producto: $nombre';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Producto &&
          runtimeType == other.runtimeType &&
          id == other.id; // Compara los productos por su atributo 'id'

  @override
  int get hashCode => id.hashCode; // Devuelve el hashCode del atributo 'id'
}

class _Categoria {
  _Categoria({
    required this.id,
    required this.nombre,
  });

  String id;
  String nombre;

  factory _Categoria.fromJson(String str) =>
      _Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _Categoria.fromMap(Map<String, dynamic> json) => _Categoria(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
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
