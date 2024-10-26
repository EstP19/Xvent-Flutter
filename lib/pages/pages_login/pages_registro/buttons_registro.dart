import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trabajo/pages/home.dart';

class ButtonsRegistro extends StatelessWidget {
  final GlobalKey<FormState> formKeyRegister; // Recibe la clave del formulario
  final TextEditingController controllerName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  final SupabaseClient supabase = Supabase.instance.client;
  ButtonsRegistro(
      {super.key,
      required this.formKeyRegister,
      required this.controllerName,
      required this.controllerEmail,
      required this.controllerPassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 42,
          child: ElevatedButton(
            onPressed: () async {
              formKeyRegister.currentState?.save();
              final email = controllerEmail.text;
              final password = controllerPassword.text;
              final name = controllerName.text;

              print('Correo: $email');
              print('Contraseña: $password');
              print('Nombre: $name');

              try {
                await supabase.auth.signUp(email: email, password: password);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Cuenta Creada'),
                  ));
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Error al intentar crear la cuenta'),
                  ));
                }

                // Agrega la lógica adicional que necesites (ej. autenticación)

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Por favor revisa los campos')),
                );
              }
            },
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
