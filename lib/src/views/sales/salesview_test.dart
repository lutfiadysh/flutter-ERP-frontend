import 'package:flutter/material.dart';

class SalesViewTest extends StatelessWidget {
  const SalesViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height - 210,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Ventas"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_rounded),
          ),
        ));
  }
}
