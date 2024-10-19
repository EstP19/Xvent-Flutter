import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_products/add_product.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_products/search_products.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_products/show_products.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/product_class.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final List<ProductS> _products = [
    ProductS(name: 'Cancha 1', price: '70000'),
    ProductS(name: 'Cancha 2', price: '60000'),
    ProductS(name: 'Cancha 3', price: '80000'),
    ProductS(name: 'Cancha 4', price: '90000')
  ];
  String _searchQuery = ''; // Variable para almacenar la búsqueda

  void _addProduct(ProductS product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query; // Actualiza la búsqueda
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ProductsSearch(onSearch: _updateSearchQuery), // Pasar el callback
              const SizedBox(height: 10),
              Expanded(
                  child: ShowProducts(
                products: filteredProducts,
                onSelectProduct: (selectedProduct) {},
              ) // Mostrar productos filtrados
                  ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: AddProduct(onAddProduct: _addProduct),
          ),
        ],
      ),
    );
  }
}
