import 'dart:convert';
import 'package:admin_dashboard/proy/models/dashboard.dart';

class DashboardsResponse {
  final List<Dashboard> dashboards;

  DashboardsResponse({
    required this.dashboards,
  });

  factory DashboardsResponse.fromJson(String str) =>
      DashboardsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardsResponse.fromMap(Map<String, dynamic> json) =>
      DashboardsResponse(
        dashboards: List<Dashboard>.from(
            json["dashboards"].map((x) => Dashboard.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "dashboards": List<dynamic>.from(dashboards.map((x) => x.toMap())),
      };
}
