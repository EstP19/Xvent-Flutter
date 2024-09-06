import 'package:flutter/material.dart';

class Recover extends StatefulWidget {
  const Recover({super.key});

  @override
  State<Recover> createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Contenido extends StatelessWidget {
  const Contenido({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Registro'),
      ),
      body: const Center(
        child: Text('Formulario de Registro'),
      ),
    );
  }
}
