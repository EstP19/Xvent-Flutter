import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/product_class.dart'; // Importa el modelo aquí

class ShowProducts extends StatelessWidget {
  final List<ProductS> products;

  const ShowProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      child: products.isNotEmpty
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        product.imageBytes != null
                            ? Image.memory(
                                product.imageBytes!,
                                width: 100,
                                height: 100,
                              )
                            : const SizedBox(width: 100, height: 100),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,
                                  style: const TextStyle(fontSize: 25)),
                              Text('\$${product.price}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 17, 121, 55))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(child: Text('No hay productos disponibles')),
    );
  }
}
