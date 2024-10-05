import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trabajo/pages/login.dart';
import 'package:intl/intl.dart' as intl;

void main() async {
  // Asegúrate de inicializar el formateo de fechas para la localización adecuada
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  intl.Intl.defaultLocale = 'es_ES';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xvent App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
