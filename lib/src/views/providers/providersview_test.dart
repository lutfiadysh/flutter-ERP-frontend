import 'package:admin_dashboard/src/views/providers/table_providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProvidersViewTest extends StatefulWidget {
  const ProvidersViewTest({super.key});

  @override
  State<ProvidersViewTest> createState() => _ProvidersViewTestState();
}

class _ProvidersViewTestState extends State<ProvidersViewTest> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    // Obtén el ancho de la pantalla actual

    // Decide si es móvil o web según el ancho de pantalla
    return SizedBox(
      height: size - 210,
      child: const Scaffold(
        body: TableProviders(),
      ),
    );
  }
}
