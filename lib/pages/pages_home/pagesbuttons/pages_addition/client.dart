import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/add_clients.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/search_clients.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/show_clients.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_products/search_products.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final List<Client> _clients = [];
  String _searchQuery = ''; // Variable para almacenar la búsqueda

  void _addClients(Client client) {
    setState(() {
      _clients.add(client);
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query; // Actualiza la búsqueda
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredClients = _clients.where((client) {
      return client.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ClientSearch(onSearch: _updateSearchQuery), // Pasar el callback
              const SizedBox(height: 10),
              Expanded(
                child: ShowClients(
                    client: filteredClients), // Mostrar productos filtrados
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: AddClients(onAddClients: _addClients),
          ),
        ],
      ),
    );
  }
}
