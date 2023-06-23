import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/branches_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/src/views/stock/card_stocks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';

@RoutePage()
class StocksViewTest extends StatefulWidget {
  const StocksViewTest({Key? key}) : super(key: key);

  @override
  State<StocksViewTest> createState() => _StocksViewTestState();
}

class _StocksViewTestState extends State<StocksViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<StocksProvider>(context, listen: false).getStocks();
    Provider.of<BranchesProvider>(context, listen: false).getBranches();
  }

  @override
  Widget build(BuildContext context) {
    final stocks = Provider.of<StocksProvider>(context).stocks;
    final sucursales = Provider.of<BranchesProvider>(context).branches;
    final size = MediaQuery.of(context).size.height;
    return SizedBox(
      height: size - 75 - 95,
      child: DefaultTabController(
        length: sucursales.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: TabBar(
                unselectedLabelColor:
                    isDark ? ColorConst.white : ColorConst.black,
                labelColor: Theme.of(context).colorScheme.primary,
                indicatorColor: Theme.of(context).colorScheme.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                isScrollable: true,
                tabs: sucursales
                    .map((sucursal) => Tab(text: sucursal.definicion))
                    .toList(),
              ),
            ),
            const SizedBox(
                height: 10), // Separación entre el TabBar y el TabBarView
            Expanded(
              child: TabBarView(
                children: sucursales.map((sucursal) {
                  final filteredStocks = stocks
                      .where((stock) => stock.sucursal.id == sucursal.id)
                      .toList();
                  return CardStocks(stocks: filteredStocks);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
