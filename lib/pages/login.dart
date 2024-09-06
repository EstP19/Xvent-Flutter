import 'package:flutter/material.dart';
import 'package:trabajo/pages/recuperar.dart';
import 'package:trabajo/pages/registro.dart';

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
          Contenido(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.green,
            width: 150,
            height: 85,
          ),
          const SizedBox(
            height: 10,
          ),
        ]));
  }
}

class Contenido extends StatefulWidget {
  const Contenido({super.key});

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
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
            onPressed: () {},
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
