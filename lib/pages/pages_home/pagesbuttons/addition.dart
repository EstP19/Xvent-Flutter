import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/client.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_addition/product.dart';

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  int _selectedAdd = 0;

  final List<Widget> _widgetAdd = <Widget>[
    const Client(),
    const Product(),
  ];

  void _buttonsAdd(int index) {
    setState(() {
      _selectedAdd = index; // Cambia el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // Cambiar a Column para incluir los botones y el contenido
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _buttonsAdd(0), // Cambiar a General
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedAdd == 0
                              ? Colors.white
                              : Colors
                                  .grey, // Cambia el color si es seleccionado
                        ),
                        child: Text(
                          'Clientes',
                          style: TextStyle(
                            color:
                                _selectedAdd == 0 ? Colors.grey : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            _buttonsAdd(1), // Cambiar a Notificaciones
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _selectedAdd == 1 ? Colors.white : Colors.grey,
                        ),
                        child: Text(
                          'Productos',
                          style: TextStyle(
                            color:
                                _selectedAdd == 1 ? Colors.grey : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: _widgetAdd[_selectedAdd], // Muestra el widget seleccionado
          ),
        ]);
  }
}
