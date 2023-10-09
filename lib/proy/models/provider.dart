import 'dart:convert';

class Proveedor {
  final bool estado;
  final String id;
  String nombre;
  String? telefono;
  String? correo;

  Proveedor({
    required this.estado,
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.correo,
  });

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        correo: json["correo"],
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "telefono": telefono,
        "correo": correo,
      };
}
