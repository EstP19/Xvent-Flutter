import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/bussiness.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/general.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/notifications.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/security.dart';

class ButtonsSettings extends StatefulWidget {
  const ButtonsSettings({super.key});

  @override
  State<ButtonsSettings> createState() => _ButtonsSettingsState();
}

class _ButtonsSettingsState extends State<ButtonsSettings> {
  int _selectedSettings = 0;

  final List<Widget> _widgetSetting = <Widget>[
    const General(),
    const Notificaciones(),
    const Seguridad(),
    const Negocio(),
  ];

  void _buttonsType(int index) {
    setState(() {
      _selectedSettings = index; // Cambia el índice seleccionado
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
              ElevatedButton(
                onPressed: () => _buttonsType(0), // Cambiar a General
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedSettings == 0
                      ? Colors.white
                      : Colors.grey, // Cambia el color si es seleccionado
                ),
                child: Text(
                  'General',
                  style: TextStyle(
                    color: _selectedSettings == 0 ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _buttonsType(1), // Cambiar a Notificaciones
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedSettings == 1 ? Colors.white : Colors.grey,
                ),
                child: Text(
                  'Notificaciones',
                  style: TextStyle(
                    color: _selectedSettings == 1 ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _buttonsType(2), // Cambiar a Seguridad
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedSettings == 2 ? Colors.white : Colors.grey,
                ),
                child: Text(
                  'Seguridad',
                  style: TextStyle(
                    color: _selectedSettings == 2 ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _buttonsType(3), // Cambiar a Negocio
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedSettings == 3 ? Colors.white : Colors.grey,
                ),
                child: Text(
                  'Negocio',
                  style: TextStyle(
                    color: _selectedSettings == 3 ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _widgetSetting[
              _selectedSettings], // Muestra el widget seleccionado
        ),
      ],
    );
  }
}
