import 'package:flutter/material.dart';
import 'package:trabajo/pages/pages_home/buttons_feed.dart';
import 'package:trabajo/pages/pages_home/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido'), actions: <Widget>[
        IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            icon: const Icon(Icons.settings_outlined))
      ]),
      body: const Stack(
        children: [ButtonsFeed()],
      ),
    );
  }
}
