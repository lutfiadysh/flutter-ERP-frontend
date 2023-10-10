import 'dart:convert';

import 'package:admin_dashboard/proy/models/order.dart';

class OrderResponse {
  final int total;
  final List<Pedido> pedidos;

  OrderResponse({
    required this.total,
    required this.pedidos,
  });

  factory OrderResponse.fromJson(String str) =>
      OrderResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderResponse.fromMap(Map<String, dynamic> json) => OrderResponse(
        total: json["total"],
        pedidos:
            List<Pedido>.from(json["pedidos"].map((x) => Pedido.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "pedidos": List<dynamic>.from(pedidos.map((x) => x.toMap())),
      };
}
