import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(
              'assets/imglogo.png', // Ruta de la imagen
              fit: BoxFit.cover, // Ajuste de la imagen
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
