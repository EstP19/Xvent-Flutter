import 'package:flutter/material.dart';

class ButtonsRegistro extends StatelessWidget {
  const ButtonsRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 42,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(201, 31, 63, 194)),
              side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(
                  color: Color.fromARGB(201, 31, 63, 194),
                  width: 2.0,
                ),
              ),
            ),
            child: const Text(
              'Registrarse',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: 42,
          child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 255, 255, 255),
                ),
                side: WidgetStateProperty.all<BorderSide>(
                  const BorderSide(
                    color: Color.fromARGB(201, 31, 63, 194),
                    width: 2.0,
                  ),
                ),
              ),
              child: const Text(
                'Ingresa con Google',
                style: TextStyle(
                  color: Color.fromARGB(201, 31, 63, 194),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
        ),
      ],
    );
  }
}
