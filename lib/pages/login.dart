import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/logo.dart';
import 'package:trabajo/pages/pages_login/content.dart';

class LoginPage extends StatefulWidget {
  static const routename = '/login'; // Definición de la ruta

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Fondo(),
          Positioned(
              top: 10,
              right: 0,
              left: 0,
              child: Center(
                child: Logo(),
              )),
          Positioned(
              top: 90,
              right: 0,
              left: 0,
              child: Center(
                child: Cuerpo(),
              )),
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
