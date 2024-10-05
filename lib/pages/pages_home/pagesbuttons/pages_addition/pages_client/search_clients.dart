import 'package:flutter/material.dart';

class ClientSearch extends StatefulWidget {
  final Function(String) onSearch; // Callback para enviar texto de búsqueda

  const ClientSearch({super.key, required this.onSearch});

  @override
  State<ClientSearch> createState() => _ClientSearchState();
}

class _ClientSearchState extends State<ClientSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      onChanged: (value) {
        widget.onSearch(value); // Llama al callback al cambiar el texto
      },
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        hintText: 'Buscar usuarios...',
      ),
    );
  }
}
