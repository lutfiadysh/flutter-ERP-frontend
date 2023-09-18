import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/transfers/card_transfers.dart';
import 'package:admin_dashboard/src/views/transfers/table_transfer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../proy/providers/transfers_provider.dart';

@RoutePage()
class TransfersViewTest extends StatefulWidget {
  const TransfersViewTest({super.key});

  @override
  State<TransfersViewTest> createState() => _TransfersViewTestState();
}

class _TransfersViewTestState extends State<TransfersViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<TransfersProvider>(context, listen: false).getTransfers();
  }

  @override
  Widget build(BuildContext context) {
    final traspasos = Provider.of<TransfersProvider>(context).traspasos;
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 800;
    final tabsRouter = AutoTabsRouter.of(context);
    final double navigationBarHeight = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: size.height - 210 - navigationBarHeight,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Traspasos'),
        ),
        floatingActionButton: isLargeScreen
            ? FloatingActionButton.extended(
                onPressed: () {
                  tabsRouter.setActiveIndex(44);
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('Crear Traspaso'),
              )
            : FloatingActionButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(44);
                },
                child: const Icon(Icons.add_rounded),
              ),
        body: Responsive.isMobile(context)
            ? CardTransfers(
                traspasos: traspasos,
              )
            : TableTransfer(transfers: traspasos),
      ),
    );
  }
}
