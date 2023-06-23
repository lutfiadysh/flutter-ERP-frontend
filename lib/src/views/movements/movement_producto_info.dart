import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String productName;
  final int totalEntryBoxes;
  final int totalEntryPieces;
  final int totalExitBoxes;
  final int totalExitPieces;

  const ProductInfo({
    Key? key,
    required this.productName,
    required this.totalEntryBoxes,
    required this.totalEntryPieces,
    required this.totalExitBoxes,
    required this.totalExitPieces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text('Entradas: $totalEntryBoxes cajas, $totalEntryPieces piezas'),
        Text('Salidas: $totalExitBoxes cajas, $totalExitPieces piezas'),
      ],
    );
  }
}
