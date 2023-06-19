import 'dart:convert';

import '../branch.dart';

class BranchesResponse {
  BranchesResponse({
    required this.total,
    required this.sucursales,
  });

  int total;
  List<Branch> sucursales;

  factory BranchesResponse.fromJson(String str) =>
      BranchesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BranchesResponse.fromMap(Map<String, dynamic> json) => BranchesResponse(
        total: json["total"],
        sucursales:
            List<Branch>.from(json["sucursales"].map((x) => Branch.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "sucursales": List<dynamic>.from(sucursales.map((x) => x.toMap())),
      };
}