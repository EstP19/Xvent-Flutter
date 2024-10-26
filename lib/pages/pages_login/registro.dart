import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/pages_registro/cuerpo_registro.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Creemos una cuenta para ti',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 154, 153, 153),
              ],
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const Stack(
        children: [
          Fondo(),
          Contenido(),
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 153, 154, 154),
        Color.fromARGB(255, 0, 0, 0)
      ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
    );
  }
}
