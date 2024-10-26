import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/registro.dart';

class NuevaCuenta extends StatelessWidget {
  const NuevaCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Register()),
          );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 255, 255)),
          side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2.0,
            ),
          ),
        ),
        child: const Text(
          '¿No tienes cuenta?, Crea una aquí',
          style: TextStyle(
              color: Colors.black, decoration: TextDecoration.underline),
        ));
  }
}
