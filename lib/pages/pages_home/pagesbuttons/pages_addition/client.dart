import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/add_clients.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/search_clients.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/pages_client/show_clients.dart';
import 'client_class.dart'; // Asegúrate de tener tu clase Client definida en este archivo

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final List<Client> _clients = [
    Client(name: 'Juan Pérez', cedula: '123456789', phone: '555-1234'),
    Client(name: 'María Gómez', cedula: '987654321', phone: '555-5678'),
    Client(name: 'Pedro Sánchez', cedula: '123456767', phone: '555-1267'),
    Client(name: 'Carlos Pérez', cedula: '987654345', phone: '555-5692'),
  ]; // Inicializar la lista de clientes
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

  void _showAddClientDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddClients(onAddClients: (newClient) {
          _addClients(newClient);
          // Cierra el diálogo después de agregar
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar clientes de ambas listas
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
                  client: filteredClients,
                  onSelectClient: (selectedClient) {},
                ), // Mostrar productos filtrados
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed:
                  _showAddClientDialog, // Muestra el diálogo al presionar
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                fixedSize: const Size(75, 75),
                padding: EdgeInsets.zero,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
