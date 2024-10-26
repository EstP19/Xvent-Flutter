import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trabajo/pages/home.dart';
import 'package:trabajo/pages/login.dart';
import 'package:intl/intl.dart' as intl;
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Asegúrate de inicializar el formateo de fechas para la localización adecuada
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  intl.Intl.defaultLocale = 'es_ES';
  await Supabase.initialize(
    url: 'https://cvkbgzxzeyrzoixgxmht.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2a2Jnenh6ZXlyem9peGd4bWh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk2NDE1MTEsImV4cCI6MjA0NTIxNzUxMX0.VtVYBP6uxNolyZPbmumWMKMJSZCFZi0CYU5Ddu2fQOk',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xvent App',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routename,
      routes: {
        LoginPage.routename: (context) => const LoginPage(),
        Home.routename: (context) => const Home(),
      },
    );
  }
}
