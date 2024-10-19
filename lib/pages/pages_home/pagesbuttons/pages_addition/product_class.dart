// Clase para representar un producto
import 'dart:typed_data';

class ProductS {
  final String name;
  final String price;
  final Uint8List? imageBytes;

  ProductS({required this.name, required this.price, this.imageBytes});
}

void main() {
  // Ejemplo de datos de imagen como Uint8List (puedes reemplazarlos con datos reales)
  Uint8List image1 = Uint8List.fromList([0, 1, 2, 3]); // Simulando una imagen
  Uint8List image2 = Uint8List.fromList([4, 5, 6, 7]); // Simulando otra imagen

  // Crear productos
  ProductS product1 = ProductS(
    name: 'Laptop',
    price: '999.99',
    imageBytes: image1,
  );

  ProductS product2 = ProductS(
    name: 'Smartphone',
    price: '499.99',
    imageBytes: image2,
  );
}
