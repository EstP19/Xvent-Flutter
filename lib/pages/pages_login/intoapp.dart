import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trabajo/pages/home.dart';

class Botones extends StatelessWidget {
  final GlobalKey<FormState> formKeyLogin; // Receives the form key
  final TextEditingController controllerEmailLogin;
  final TextEditingController controllerPasswordLogin;
  final SupabaseClient supabase = Supabase.instance.client;

  Botones({
    super.key,
    required this.formKeyLogin,
    required this.controllerEmailLogin,
    required this.controllerPasswordLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              formKeyLogin.currentState?.save();
              final emailLogin = controllerEmailLogin.text;
              final passwordLogin = controllerPasswordLogin.text;

              if (formKeyLogin.currentState?.validate() ?? false) {
                try {
                  await supabase.auth.signInWithPassword(
                      email: emailLogin, password: passwordLogin);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ingresando...')),
                  );

                  Navigator.pushNamed(context, Home.routename);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error al iniciar sesión')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Por favor revisa los campos')),
                );
              }
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
              onPressed: () async {
                const webClientId =
                    '739238251445-a0garjc272b6jecielvbsjisk6nsfeli.apps.googleusercontent.com';

                /// TODO: update the iOS client ID with your own.
                ///

                // Google sign in on Android will work without providing the Android
                // Client ID registered on Google Cloud.

                final GoogleSignIn googleSignIn = GoogleSignIn(
                  clientId: webClientId,
                );
                final googleUser = await googleSignIn.signIn();
                final googleAuth = await googleUser!.authentication;
                final accessToken = googleAuth.accessToken;
                final idToken = googleAuth.idToken;

                if (accessToken == null) {
                  throw 'No Access Token found.';
                }
                if (idToken == null) {
                  throw 'No ID Token found.';
                }

                await supabase.auth.signInWithIdToken(
                  provider: OAuthProvider.google,
                  idToken: idToken,
                  accessToken: accessToken,
                );
              },
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
