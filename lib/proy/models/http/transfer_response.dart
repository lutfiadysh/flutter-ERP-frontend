// To parse this JSON data, do
//
//     final transferResponse = transferResponseFromMap(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/proy/models/transfer.dart';

class TransferResponse {
    TransferResponse({
        required this.total,
        required this.traspasos,
    });

    int total;
    List<Traspaso> traspasos;

    factory TransferResponse.fromJson(String str) => TransferResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransferResponse.fromMap(Map<String, dynamic> json) => TransferResponse(
        total: json["total"],
        traspasos: List<Traspaso>.from(json["traspasos"].map((x) => Traspaso.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "traspasos": List<dynamic>.from(traspasos.map((x) => x.toMap())),
    };
}
