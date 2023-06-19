import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/stocks_response.dart';
import 'package:flutter/material.dart';

import '../models/stock.dart';

class StocksProvider extends ChangeNotifier {
  List<Stock> stocks = [];

  getStocks() async {
    final respInputs = await BackendApi.httpGet('/stocks');
    final stocksResponse = StocksResponse.fromMap(respInputs);

    stocks = [...stocksResponse.stocks];


    notifyListeners();
  }

}
