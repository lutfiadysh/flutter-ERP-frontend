import 'dart:convert';

import '../stock.dart';

class StocksResponse {
  StocksResponse({
    required this.total,
    required this.stocks,
  });

  int total;
  List<Stock> stocks;

  factory StocksResponse.fromJson(String str) =>
      StocksResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StocksResponse.fromMap(Map<String, dynamic> json) => StocksResponse(
        total: json["total"],
        stocks: List<Stock>.from(
            json["stocks"].map((x) => Stock.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "stocks": List<dynamic>.from(stocks.map((x) => x.toMap())),
      };
}
