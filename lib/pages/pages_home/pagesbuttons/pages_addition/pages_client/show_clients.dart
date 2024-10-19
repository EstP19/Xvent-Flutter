import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';

class ShowClients extends StatelessWidget {
  final List<Client> client;
  final Function(Client)
      onSelectClient; // Función para manejar la selección de un cliente

  const ShowClients({
    super.key,
    required this.client,
    required this.onSelectClient, // Agrega el parámetro
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
      child: client.isNotEmpty
          ? ListView.builder(
              itemCount: client.length,
              itemBuilder: (context, index) {
                final showClientsInWindows = client[index];
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
                              Text(showClientsInWindows.name,
                                  style: const TextStyle(fontSize: 25)),
                              Text(showClientsInWindows.cedula,
                                  style: const TextStyle(fontSize: 18)),
                              Text(showClientsInWindows.phone,
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        // Botón para seleccionar cliente
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
