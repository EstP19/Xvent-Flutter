import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trabajo/pages/login.dart';
import 'package:trabajo/pages/pages_home/buttons_feed.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/bussiness.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/general.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/notifications.dart';
import 'package:trabajo/pages/pages_home/pagessetting/pages_buttons_settings/security.dart';

class Home extends StatefulWidget {
  static const routename = '/home'; // Definición de la ruta

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final SupabaseClient supabase = Supabase.instance.client;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: const Icon(Icons.settings_outlined, size: 35),
            onSelected: (int value) async {
              // Verifica el valor y navega a la página correspondiente
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const General()),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Negocio()),
                );
              } else if (value == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notificaciones()),
                );
              } else if (value == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Seguridad()),
                );
              } else if (value == 5) {
                try {
                  await supabase.auth.signOut();
                  Navigator.pushReplacementNamed(context, LoginPage.routename);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No se puede cerrar sesion')));
                }
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('General'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Negocio'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('Notificaciones'),
              ),
              const PopupMenuItem<int>(
                value: 4,
                child: Text('Seguridad'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<int>(
                value: 5,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: const Stack(
        children: [ButtonsFeed()],
      ),
    );
  }
}
