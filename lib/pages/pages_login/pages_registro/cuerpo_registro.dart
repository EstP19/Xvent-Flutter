import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_login/pages_registro/datos_registro.dart';

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
          DatosRegistro(),
        ],
      ),
    );
  }
}
