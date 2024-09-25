import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/dates.dart';

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _ContenidoState();
}

class _ContenidoState extends State<Cuerpo> {
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
