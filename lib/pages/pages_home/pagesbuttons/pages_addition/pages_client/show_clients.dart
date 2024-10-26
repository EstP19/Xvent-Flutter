import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';

class ShowClients extends StatelessWidget {
  final List<Client>
      clients; // Cambié el nombre de 'client' a 'clients' para mayor claridad
  final Function(Client)
      onSelectClient; // Función para manejar la selección de un cliente

  const ShowClients({
    super.key,
    required this.clients, // Asegúrate de que el nombre coincida
    required this.onSelectClient,
    required List<Client> client,
  });

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
      child: clients.isNotEmpty
          ? ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final clientToShow = clients[
                    index]; // Cambié el nombre a 'clientToShow' para mayor claridad
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(clientToShow.name,
                                  style: const TextStyle(fontSize: 25)),
                              Text(clientToShow.cedula,
                                  style: const TextStyle(fontSize: 18)),
                              Text(clientToShow.phone,
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons
                              .select_all), // Cambia el ícono según tus preferencias
                          onPressed: () {
                            // Llama a la función onSelectClient con el cliente seleccionado
                            onSelectClient(clientToShow);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(child: Text('No hay clientes agregados')),
    );
  }
}
