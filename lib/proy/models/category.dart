import 'dart:convert';

class Categoria {
  Categoria({
    required this.id,
    required this.nombre,
    required this.usuario,
    required this.dimensiones,
    required this.acabado,
    required this.material,
    required this.precioCaja,
    required this.unidadesPorCaja,
    required this.precioPorUnidad,
  });

  String id;
  String nombre;
  String dimensiones;
  String acabado;
  String material;
  double precioCaja;
  int unidadesPorCaja;
  double precioPorUnidad;
  _Usuario usuario;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        dimensiones: json["dimensiones"],
        acabado: json["acabado"],
        material: json["material"],
        precioCaja: json["precioCaja"].toDouble(),
        unidadesPorCaja: json["unidadesPorCaja"],
        precioPorUnidad: json["precioPorUnidad"].toDouble(),
        usuario: _Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "dimensiones": dimensiones,
        "acabado": acabado,
        "material": material,
        "precioCaja": precioCaja,
        "unidadesPorCaja": unidadesPorCaja,
        "precioPorUnidad": precioPorUnidad,
        "usuario": usuario.toMap(),
      };

  @override
  String toString() {
    return 'Categoria: $nombre';
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
