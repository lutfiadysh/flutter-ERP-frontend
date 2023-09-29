//provider para el dashboard

import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/dashboard_response.dart';
import 'package:admin_dashboard/proy/models/dashboard.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  List<Dashboard> dashboards = [];

  Dashboard? dashboard;

  getDashboards() async {
    final resp = await BackendApi.httpGet('/dashboard');
    final dashboardResp = DashboardsResponse.fromMap(resp);

    dashboards = [...dashboardResp.dashboards];

    notifyListeners();
  }
}
