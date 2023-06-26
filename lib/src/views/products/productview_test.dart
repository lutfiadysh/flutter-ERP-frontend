import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:provider/provider.dart';
import '../../../proy/models/product.dart';
import 'package:file_picker/file_picker.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';

class ProductViewTest extends StatefulWidget {
  final String productId;

  const ProductViewTest({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductViewTestState createState() => _ProductViewTestState();
}

class _ProductViewTestState extends State<ProductViewTest> {
  late Future<Producto?> fetchProduct;

  @override
  void initState() {
    super.initState();
    fetchProduct = Provider.of<ProductsProvider>(context, listen: false)
        .getProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Producto?>(
      future: fetchProduct,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error loading product details'));
        }

        return ProductDetails(product: snapshot.data!);
      },
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Producto product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImage(product: product),
            const SizedBox(height: 20),
            ProductForm(product: product),
          ],
        ),
      ),
    );
  }
}

class ProductForm extends StatefulWidget {
  final Producto product;

  const ProductForm({Key? key, required this.product}) : super(key: key);

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceBoxController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.nombre;
    priceBoxController.text = widget.product.precioCaja.toString();
    unitPriceController.text = widget.product.precioPorUnidad.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProductTitle(),
        const SizedBox(height: 20),
        _buildTextField(
          controller: nameController,
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
          hint: "Ingrese el precio por caja",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: unitPriceController,
          hint: "Ingrese el precio por unidad",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hint,
      TextInputType? keyboardType,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hint),
      validator: validator,
    );
  }

  Widget _buildProductTitle() {
    return Text(
      widget.product.nombre,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      ),
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
        } else {
          print('No hay imagen seleccionada');
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: image,
      ),
    );
  }
}
