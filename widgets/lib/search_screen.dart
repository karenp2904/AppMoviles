import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<String> items = [
    'Manzana', 'Banana', 'Cereza', 'Durazno', 'Fresa', 'Uva', 'Mango', 'Piña', 'Naranja', 'Pera'
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Búsqueda")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Buscar...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text("No hay resultados"))
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredItems[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
