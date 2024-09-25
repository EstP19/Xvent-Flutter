import 'package:flutter/material.dart';

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
