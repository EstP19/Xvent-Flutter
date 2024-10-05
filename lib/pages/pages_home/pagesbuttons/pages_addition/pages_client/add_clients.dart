import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client_class.dart';

class AddClients extends StatefulWidget {
  final Function(Client)
      onAddClients; // Función que recibe el producto agregado

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
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Agregar Cliente'),
            content: SizedBox(
              height: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Nombre',
                    ),
                  ),
                  TextField(
                    controller: _cedulaController,
                    decoration: const InputDecoration(
                      hintText: 'Cédula',
                    ),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Telefono',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Crea un nuevo producto y llama a la función para agregarlo
                      if (_nameController.text.isNotEmpty &&
                          _cedulaController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty) {
                        final newClient = Client(
                          name: _nameController.text,
                          cedula: _cedulaController.text,
                          phone: _phoneController.text,
                        );
                        widget.onAddClients(
                            newClient); // Llama a la función pasada
                        Navigator.of(context).pop(); // Cierra el diálogo
                      }
                    },
                    child: const Text('Agregar'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancelar'))
                ],
              ),
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        fixedSize: Size(75, 75),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 55,
      ),
    );
  }
}
