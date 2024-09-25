import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/pagessetting/buttons_settings.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: const ButtonsSettings(),
    );
  }
}
