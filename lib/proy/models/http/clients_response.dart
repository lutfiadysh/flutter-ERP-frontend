import 'dart:convert';

import 'package:admin_dashboard/proy/models/client.dart';

class ClientsResponse {
  final int total;
  final List<Cliente> clientes;

  ClientsResponse({
    required this.total,
    required this.clientes,
  });

  factory ClientsResponse.fromJson(String str) =>
      ClientsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientsResponse.fromMap(Map<String, dynamic> json) => ClientsResponse(
        total: json["total"],
        clientes:
            List<Cliente>.from(json["clientes"].map((x) => Cliente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "clientes": List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}
