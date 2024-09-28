// Clase para representar un producto
import 'dart:typed_data';

class ProductS {
  final String name;
  final String price;
  final Uint8List? imageBytes;

  ProductS({required this.name, required this.price, this.imageBytes});
}
