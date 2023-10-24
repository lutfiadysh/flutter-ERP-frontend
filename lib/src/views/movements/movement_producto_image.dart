import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/no-image.jpg', fit: BoxFit.cover);
              },
            )
          : Image.asset('assets/no-image.jpg', fit: BoxFit.cover),
    );
  }
}
