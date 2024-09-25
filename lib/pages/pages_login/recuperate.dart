import 'package:flutter/material.dart';
import 'package:trabajo/pages/recuperar.dart';

class Remember extends StatefulWidget {
  const Remember({super.key});

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: valor,
            onChanged: (value) {
              setState(() {
                valor == false ? valor = true : valor = false;
              });
            }),
        const Text('Recordarme'),
        const Spacer(),
        OutlinedButton(
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
            ),
            child: const Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
