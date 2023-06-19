import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
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
    return Container(
      child: Builder(builder: (context) {
        if (producto == null) {
          return Container(
            alignment: Alignment.center,
            height: 300,
            child: const CircularProgressIndicator(),
          );
        } else {
          return ProductViewModal(producto: producto);
        }
      }),
    );
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
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              _AvatarContainerMobile(producto: producto),
              FxBox.h20,
              _UserData(producto: producto),
            ],
          ),
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
    String? nombre;
    double? precioPorCaja;
    double? precioPorUnidad;

    final productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          producto!.nombre,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          initialValue: producto!.nombre,
          onChanged: (value) => nombre = value,
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
        TextFormField(
          initialValue: producto!.precioCaja.toString(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            final parsedValue = double.tryParse(value);
            if (parsedValue != null) {
              precioPorCaja = parsedValue;
            }
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          initialValue: producto!.precioPorUnidad.toString(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (value) {
            final parsedValue = double.tryParse(value);
            if (parsedValue != null) {
              precioPorUnidad = parsedValue;
            }
          },
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 120, maxHeight: 45),
            child: ElevatedButton(
                onPressed: () async {
                  final String updatedNombre = nombre ?? producto!.nombre;
                  final double? updatedPrecioPorCaja =
                      precioPorCaja ?? producto!.precioCaja;
                  final double? updatedPrecioPorUnidad =
                      precioPorUnidad ?? producto!.precioPorUnidad;

                  final saved = await productsProvider.updateProduct(
                      producto!.id,
                      updatedNombre,
                      updatedPrecioPorCaja,
                      updatedPrecioPorUnidad);
                  if (saved) {
                    Navigator.pop(context);
                    NotificationsService.showSnackbar('Producto actualizado');
                  } else {
                    Navigator.pop(context);
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar');
                  }
                },
                child: Row(
                  children: const [
                    Icon(Icons.save_outlined, size: 20),
                    Text(' Guardar ')
                  ],
                )),
          ),
        )
      ],
    );
  }
}

class _AvatarContainerMobile extends StatelessWidget {
  final Producto? producto;

  const _AvatarContainerMobile({this.producto});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final image = (producto!.img == null)
        ? const Image(image: AssetImage('assets/no-image.jpg'))
        : SizedBox(
            width: 250,
            height: 250,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/loader.gif',
              image: producto!.img!,
              fit: BoxFit.cover, // ajusta la imagen al contenedor
              width: 250, // establece un ancho máximo
              height: 250, // establece un alto máximo
            ),
          );

    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: image,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                elevation: 0,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          withData: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg'],
                          allowMultiple: false);

                  if (result != null) {
                    PlatformFile file = result.files.first;
                    NotificationsService.showBusyIndicator(context);
                    final resp = await productsProvider.uploadImage(
                        '/uploads/productos/${producto!.id}', file.bytes!);
                    print(resp);
                    Provider.of<ProductsProvider>(context, listen: false)
                        .refreshProduct(resp);
                    Navigator.of(context).pop();
                  } else {
                    print('no hay imagen');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
