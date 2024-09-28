// add_product.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/product_class.dart';

class AddProduct extends StatefulWidget {
  final Function(ProductS)
      onAddProduct; // Función que recibe el producto agregado

  const AddProduct({super.key, required this.onAddProduct});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String imageGet = '';
  Uint8List? _imageBytes;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Agregar Producto'),
            content: SizedBox(
              height: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );

                      if (pickedFile != null) {
                        final Uint8List imageBytes =
                            await pickedFile.readAsBytes();
                        setState(() {
                          _imageBytes =
                              imageBytes; // Guarda los bytes de la imagen
                        });
                      }
                    },
                    child: const Text('Cargar Imagen'),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Nombre',
                    ),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      hintText: 'Precio',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Crea un nuevo producto y llama a la función para agregarlo
                      if (_nameController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty) {
                        final newProduct = ProductS(
                          name: _nameController.text,
                          price: _priceController.text,
                          imageBytes: _imageBytes,
                        );
                        widget.onAddProduct(
                            newProduct); // Llama a la función pasada
                        Navigator.of(context).pop(); // Cierra el diálogo
                      }
                    },
                    child: const Text('Agregar'),
                  ),
                  SizedBox(height: 5),
                  _imageBytes != null
                      ? Image.memory(_imageBytes!,
                          width: 50,
                          height: 50) // Muestra la imagen seleccionada
                      : const Text('No se ha seleccionado ninguna imagen'),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar'))
                ],
              ),
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(75, 75),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 55,
      ),
    );
  }
}
