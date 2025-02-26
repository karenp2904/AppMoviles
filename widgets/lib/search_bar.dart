import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  const SearchBar({Key? key, required this.controller, required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onSearch,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Buscar...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
