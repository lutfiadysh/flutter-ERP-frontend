import 'dart:convert';

class Branch {
  Branch({
    required this.categoria,
    required this.id,
    required this.definicion,
    required this.direccion,
    required this.usuario,
  });

  String categoria;
  String id;
  String definicion;
  String direccion;
  _Usuario usuario;

  factory Branch.fromJson(String str) => Branch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Branch.fromMap(Map<String, dynamic> json) => Branch(
        categoria: json["categoria"],
        id: json["_id"],
        definicion: json["definicion"],
        direccion: json["direccion"],
        usuario: _Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "categoria": categoria,
        "_id": id,
        "definicion": definicion,
        "direccion": direccion,
        "usuario": usuario.toMap(),
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
