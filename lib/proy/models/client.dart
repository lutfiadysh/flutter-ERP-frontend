import 'dart:convert';

class Cliente {
  Cliente({
    required this.id,
    required this.nombre,
    this.nit,
    required this.estado,
    this.ci,
    required this.codigoCliente,
  });

  String id;
  String nombre;
  String? nit;
  bool estado;
  String? ci;
  String codigoCliente;

  factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        id: json["_id"],
        nombre: json["nombre"],
        nit: json["nit"],
        estado: json["estado"],
        ci: json["ci"],
        codigoCliente: json["codigoCliente"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "nit": nit,
        "estado": estado,
        "ci": ci,
        "codigoCliente": codigoCliente,
      };
}
