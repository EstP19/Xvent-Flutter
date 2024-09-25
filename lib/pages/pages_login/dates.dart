import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/create.dart';
import 'package:trabajo/pages/pages_login/intoapp.dart';
import 'package:trabajo/pages/pages_login/recuperate.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              hintText: 'example@email.com',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Contraseña',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: obs,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                hintText: 'Ingresa tu contraseña',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obs == true ? obs = false : obs = true;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined))),
          ),
          const Remember(),
          const SizedBox(
            height: 15,
          ),
          const Botones(),
          const SizedBox(
            height: 3,
          ),
          const NuevaCuenta(),
        ],
      ),
    );
  }
}
