import 'package:flutter/material.dart';
import 'package:trabajo/pages/home.dart';

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(201, 31, 63, 194))),
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
          width: double.infinity,
        ),
        const Text(
          'O ingresa con: ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 5,
          width: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
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
                  fontSize: 18,
                ),
              )),
        )
      ],
    );
  }
}
