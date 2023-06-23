import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../proy/models/product.dart';

class ProductViewTest extends StatefulWidget {
  final String id;

  const ProductViewTest({super.key, required this.id});

  @override
  State<ProductViewTest> createState() => _ProductViewTestState();
}

class _ProductViewTestState extends State<ProductViewTest> {
  Producto? producto;

  @override
  void initState() {
    super.initState();
    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);

    productsProvider.getProductById(widget.id).then((productDB) {
      setState(() {
        producto = productDB;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (producto == null) {
        return Container(
          alignment: Alignment.center,
          height: 300,
          child: const CircularProgressIndicator(),
        );
      } else {
        return ProductViewModal(producto: producto);
      }
    });
  }
}

class ProductViewModal extends StatelessWidget {
  const ProductViewModal({
    Key? key,
    this.producto,
  }) : super(key: key);

  final Producto? producto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Agrega esto para solucionar el desbordamiento
        child: Column(
          children: [
            _AvatarContainerMobile(producto: producto),
            const SizedBox(height: 20),
            _UserData(producto: producto),
          ],
        ),
      ),
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({
    Key? key,
    this.producto,
  }) : super(key: key);

  final Producto? producto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTituloProducto(),
        const SizedBox(height: 20),
        _buildTextField(
          initialValue: producto!.nombre,
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
          initialValue: producto!.precioCaja.toString(),
          hint: "Ingrese el precio por caja",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildTextField(
          initialValue: producto!.precioPorUnidad.toString(),
          hint: "Ingrese el precio por unidad",
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildTextField(
      {required String initialValue,
      required String hint,
      TextInputType? keyboardType,
      String? Function(String?)? validator}) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hint),
      validator: validator,
    );
  }

  Widget _buildTituloProducto() {
    return Text(
      producto!.nombre,
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
              producto!.id,
              producto!.nombre,
              producto!.precioCaja,
              producto!.precioPorUnidad);
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

class _AvatarContainerMobile extends StatefulWidget {
  final Producto? producto;

  const _AvatarContainerMobile({this.producto});

  @override
  _AvatarContainerMobileState createState() => _AvatarContainerMobileState();
}

class _AvatarContainerMobileState extends State<_AvatarContainerMobile> {
  String? _imageURL;

  @override
  void initState() {
    super.initState();
    _imageURL = widget.producto!.img;
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    Widget image = _imageURL == null
        ? const Image(image: AssetImage('assets/no-image.jpg'))
        : FadeInImage.assetNetwork(
            placeholder: 'assets/loader.gif',
            image: _imageURL!,
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
              '/uploads/productos/${widget.producto!.id}', file.bytes!);

          setState(() {
            _imageURL = resp.img; // actualiza el estado de la imagen
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
