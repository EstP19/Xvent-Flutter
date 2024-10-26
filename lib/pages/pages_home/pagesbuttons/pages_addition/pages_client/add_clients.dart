import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';
import 'package:trabajo/service/database/database.dart';

class AddClients extends StatefulWidget {
  final Function(Client) onAddClients;

  const AddClients({super.key, required this.onAddClients});

  @override
  State<AddClients> createState() => _AddClientsState();
}

class _AddClientsState extends State<AddClients> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Cliente'),
      content: SizedBox(
        height: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Nombre'),
            ),
            TextField(
              controller: _cedulaController,
              decoration: const InputDecoration(hintText: 'Cédula'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(hintText: 'Teléfono'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isNotEmpty &&
                    _cedulaController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty) {
                  try {
                    await createClient(
                      _nameController.text,
                      _cedulaController.text,
                      _phoneController.text,
                    );

                    final newClient = Client(
                      name: _nameController.text,
                      cedula: _cedulaController.text,
                      phone: _phoneController.text,
                    );

                    widget.onAddClients(newClient);
                    Navigator.of(context).pop();
                  } catch (e) {
                    // Manejo de error visual para el usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error al agregar cliente: $e")),
                    );
                    print("Error al agregar cliente: $e");
                  }
                } else {
                  // Informa al usuario si falta algún campo
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Por favor, complete todos los campos.")),
                  );
                }
              },
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
