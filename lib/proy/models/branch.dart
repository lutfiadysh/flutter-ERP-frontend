import 'dart:convert';

class Branch {
  Branch({
    required this.categoria,
    required this.codigoSucursal, // Campo añadido
    required this.id,
    required this.direccion,
    required this.municipio,
    this.telefono,
    required this.usuario,
  });

  String categoria;
  int codigoSucursal; // Campo añadido
  String id;
  String direccion;
  String municipio;
  String? telefono;
  _Usuario usuario;

  factory Branch.fromJson(String str) => Branch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Branch.fromMap(Map<String, dynamic> json) => Branch(
        categoria: json["categoria"],
        codigoSucursal: json["codigoSucursal"], // Campo añadido
        id: json["_id"],
        direccion: json["direccion"],
        municipio: json["municipio"],
        telefono: json["telefono"],
        usuario: _Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "categoria": categoria,
        "codigoSucursal": codigoSucursal, // Campo añadido
        "_id": id,
        "direccion": direccion,
        "municipio": municipio,
        "telefono": telefono,
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
