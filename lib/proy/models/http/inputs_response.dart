import 'dart:convert';

import 'package:admin_dashboard/proy/models/input.dart';

class InputsResponse {
    InputsResponse({
        required this.total,
        required this.entradas,
    });

    int total;
    List<Entrada> entradas;

    factory InputsResponse.fromJson(String str) => InputsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory InputsResponse.fromMap(Map<String, dynamic> json) => InputsResponse(
        total: json["total"],
        entradas: List<Entrada>.from(json["entradas"].map((x) => Entrada.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "entradas": List<dynamic>.from(entradas.map((x) => x.toMap())),
    };
}
