import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_registro/buttons_registro.dart';

class DatosRegistro extends StatefulWidget {
  const DatosRegistro({super.key});

  @override
  State<DatosRegistro> createState() => _DatosRegistroState();
}

class _DatosRegistroState extends State<DatosRegistro> {
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre completo',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 42,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    hintText: 'Ingresa tu nombre completo',
                  ),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Email',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 42,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    hintText: 'example@email.com',
                  ),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Confirma tu Email',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 42,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    hintText: 'example@email.com',
                  ),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Contraseña',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 42,
                child: TextFormField(
                  obscureText: obs,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      hintText: 'Ingresa tu contraseña',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs == true ? obs = false : obs = true;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined))),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Confirma tu Contraseña',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 42,
                child: TextFormField(
                  obscureText: obs,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      hintText: 'Ingresa tu contraseña',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs == true ? obs = false : obs = true;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined))),
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const ButtonsRegistro(),
            ],
          ),
        ),
      ],
    );
  }
}
