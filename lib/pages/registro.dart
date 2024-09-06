import 'package:flutter/material.dart';

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

class Contenido extends StatelessWidget {
  const Contenido({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Es importante diligenciar los siguientes datos ;)',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Datos(),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
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
              const Botones(),
            ],
          ),
        ),
      ],
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({super.key});

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
