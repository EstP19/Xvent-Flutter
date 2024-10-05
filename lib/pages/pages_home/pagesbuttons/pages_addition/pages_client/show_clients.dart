import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';

class ShowClients extends StatelessWidget {
  final List<Client> client;

  const ShowClients({super.key, required this.client});

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
                final ShowClientsInWindows = client[index];
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
                              Text(ShowClientsInWindows.name,
                                  style: const TextStyle(fontSize: 25)),
                              Text('\$${ShowClientsInWindows.cedula}',
                                  style: const TextStyle(fontSize: 18)),
                              Text('\$${ShowClientsInWindows.phone}',
                                  style: const TextStyle(fontSize: 18)),
                            ],
                          ),
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
