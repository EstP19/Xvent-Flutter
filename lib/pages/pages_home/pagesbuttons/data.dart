import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_data/statisticsclient.dart';
import 'package:trabajo/pages/pages_home/pagesbuttons/pages_data/statisticsproducts.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int _selectedStatistics = 0;

  final List<Widget> _widgetViewStatistics = <Widget>[
    StatisticsClient(),
    StatisticsProducts(),
  ];

  void _buttonsStatistics(int index) {
    setState(() {
      _selectedStatistics = index; // Cambia el índice seleccionado
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
                        onPressed: () =>
                            _buttonsStatistics(0), // Cambiar a General
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedStatistics == 0
                              ? Colors.white
                              : Colors
                                  .grey, // Cambia el color si es seleccionado
                        ),
                        child: Text(
                          'Clientes',
                          style: TextStyle(
                            color: _selectedStatistics == 0
                                ? Colors.grey
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            _buttonsStatistics(1), // Cambiar a Notificaciones
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedStatistics == 1
                              ? Colors.white
                              : Colors.grey,
                        ),
                        child: Text(
                          'Productos',
                          style: TextStyle(
                            color: _selectedStatistics == 1
                                ? Colors.grey
                                : Colors.white,
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
            child: _widgetViewStatistics[
                _selectedStatistics], // Muestra el widget seleccionado
          ),
        ]);
  }
}
