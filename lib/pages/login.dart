import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/logo.dart';
import 'package:trabajo/pages/pages_login/content.dart';

class LoginPage extends StatefulWidget {
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
          Logo(),
          Cuerpo(),
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
