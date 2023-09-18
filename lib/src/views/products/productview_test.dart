import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:provider/provider.dart';
import '../../../proy/models/product.dart';
import 'package:file_picker/file_picker.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';

class ProductViewTest extends StatefulWidget {
  final Producto product;

  const ProductViewTest({Key? key, required this.product}) : super(key: key);

  @override
  _ProductViewTestState createState() => _ProductViewTestState();
}

class _ProductViewTestState extends State<ProductViewTest> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceBoxController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.nombre;
    priceBoxController.text = "${widget.product.precioCaja}";
    unitPriceController.text = "${widget.product.precioPorUnidad}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ProductImage(product: widget.product),
        const SizedBox(height: 20),
        _buildTextField(
          controller: nameController,
          label: "Nombre del Producto",
          hint: "Ingrese el nombre del producto",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese un nombre.';
            }
            if (value.length < 2) {
              return 'El nombre debe de ser de dos letras como mínimo.';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: priceBoxController,
          label: "Precio por Caja",
          hint: "Ingrese el precio por caja",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: unitPriceController,
          label: "Precio por Unidad",
          hint: "Ingrese el precio por unidad",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () async {
          final saved = await productsProvider.updateProduct(
              widget.product.id,
              nameController.text,
              double.parse(priceBoxController.text),
              double.parse(unitPriceController.text));
          if (saved) {
            Navigator.pop(context);
            NotificationsService.showSnackbar('Producto actualizado');
          } else {
            Navigator.pop(context);
            NotificationsService.showSnackbarError('No se pudo guardar');
          }
        },
        icon: const Icon(Icons.save_outlined, size: 20),
        label: const Text('Guardar'),
      ),
    );
  }
}

class ProductImage extends StatefulWidget {
  final Producto product;

  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.product.img;
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    Widget image = imageUrl == null
        ? const Image(image: AssetImage('assets/no-image.jpg'))
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif',
            image: imageUrl!,
            fit: BoxFit.cover, // ajusta la imagen al contenedor
            width: 250, // establece un ancho máximo
            height: 250, // establece un alto máximo
          );

    return InkWell(
      onLongPress: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          withData: true,
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'jpeg'],
          allowMultiple: false,
        );

        if (result != null) {
          PlatformFile file = result.files.first;
          NotificationsService.showBusyIndicator(context);
          final resp = await productsProvider.uploadImage(
              '/uploads/productos/${widget.product.id}', file.bytes!);

          setState(() {
            imageUrl = resp.img; // actualiza el estado de la imagen
          });

          Navigator.of(context).pop();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: image,
      ),
    );
  }
}
