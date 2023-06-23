import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/src/views/movements/card_movements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class VerificationsViewTest extends StatefulWidget {
  const VerificationsViewTest({super.key});

  @override
  State<VerificationsViewTest> createState() => _VerificationsViewTestState();
}

class _VerificationsViewTestState extends State<VerificationsViewTest> {
  @override
  void initState() {
    super.initState();

    Provider.of<MovementsProvider>(context, listen: false).getMovements();
  }

  @override
  Widget build(BuildContext context) {
    final movimientos = Provider.of<MovementsProvider>(context).movimientos;
    final size = MediaQuery.of(context).size.height;

    return SizedBox(
      height: size - 75 - 95,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Verificaciones"),
        ),
        body: CardMovements(movimientos: movimientos),
      ),
    );
  }
}
