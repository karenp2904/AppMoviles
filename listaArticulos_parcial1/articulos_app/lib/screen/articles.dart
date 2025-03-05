import 'package:articulos_examen/services/list_service.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  bool isGridView = false;

  ArticleService _articleService = ArticleService();

  List<Map<String, dynamic>> articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      final fetchedArticles = await _articleService.getArticles();
      setState(() {
        articles = fetchedArticles;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al cargar artículos')),
      );
    }
  }

  void toggleViewMode() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void toggleFavorite(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${articles[index]['name']} agregado a favoritos'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Artículos'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: toggleViewMode,
          ),
        ],
      ),
      body: isGridView ? buildGridView() : buildListView(),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          leading: Image.asset(
            article['image'],
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          title: Text(article['name']!),
          subtitle: Text('${article['seller']}\nCalificación: ${article['rating']}'),
          trailing: IconButton(
            icon: const Icon(Icons.star_border),
            onPressed: () => toggleFavorite(index),
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                article['image'],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              Text(
                article['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(article['seller']!),
              Text('Calificación: ${article['rating']}'),
              IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () => toggleFavorite(index),
              ),
            ],
          ),
        );
      },
    );
  }
}