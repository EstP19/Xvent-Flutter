import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/recuperar.dart';

class Remember extends StatefulWidget {
  const Remember({super.key});

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Recover()),
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
        alignment: Alignment.centerLeft, // Alinear el contenido a la izquierda
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 1.0)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Sin bordes redondeados
          ),
        ),
      ),
      child: const Text(
        '¿Olvidaste tu contraseña?',
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
