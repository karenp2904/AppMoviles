import 'package:articulos_examen/screen/logout.dart';
import 'package:articulos_examen/services/list_service.dart';
import 'package:articulos_examen/shared_preferences.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  bool isGridView = false;
  bool showFavorites = false;

  final ArticleService _articleService = ArticleService();

  List<Map<String, dynamic>> articles = [];
  List<Map<String, dynamic>> favoriteArticles = [];

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

  Future<void> fetchFavorites() async {
    try {
      final userId = await SharedPrefs.getUserId();
      if (userId != null) {
        final fetchedFavorites = await _articleService.getFavorites(userId);
        
        if(fetchedFavorites.isEmpty){
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No hay articulos favoritos')),
        );
        }
        setState(() {
          favoriteArticles = fetchedFavorites;
          showFavorites = true;
        });
        
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al cargar favoritos')),
      );
    }
  }

  void toggleViewMode() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void toggleFavoritesView() {
    setState(() {
      showFavorites = !showFavorites;
    });
    if (showFavorites) {
      fetchFavorites();
    }
  }

  Future<void> toggleFavorite(int index) async {
    final userId = await SharedPrefs.getUserId();
    final articleId = (showFavorites ? favoriteArticles : articles)[index]['id'];
    if (userId != null) {
      await _articleService.addFavorite(userId, articleId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${(showFavorites ? favoriteArticles : articles)[index]['name']} agregado a favoritos'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No fue posible añadir el producto a favoritos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayedArticles = showFavorites ? favoriteArticles : articles;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Artículos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: toggleViewMode,
          ),
          IconButton(
            icon: Icon(showFavorites ? Icons.favorite : Icons.favorite_border),
            onPressed: toggleFavoritesView,
          ),
          LogoutButton(),
        ],
      ),
      body: displayedArticles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : isGridView
              ? buildGridView(displayedArticles)
              : buildListView(displayedArticles),
    );
  }

  Widget buildListView(List<Map<String, dynamic>> displayedArticles) {
    return ListView.separated(
      itemCount: displayedArticles.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final article = displayedArticles[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              article['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            article['name']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${article['seller']}\nCalificación: ${article['rating']}',
          ),
          trailing: IconButton(
            icon: const Icon(Icons.star_border, color: Colors.amber),
            onPressed: () => toggleFavorite(index),
          ),
        );
      },
    );
  }

  Widget buildGridView(List<Map<String, dynamic>> displayedArticles) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemCount: displayedArticles.length,
      itemBuilder: (context, index) {
        final article = displayedArticles[index];
        return Card(
          elevation: 4,
          color: const Color.fromARGB(255, 239, 169, 193),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  article['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                article['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                article['seller']!,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                'Calificación: ${article['rating']}',
                style: const TextStyle(color: Colors.brown),
              ),
              IconButton(
                icon: const Icon(Icons.star_border, color: Colors.red),
                onPressed: () => toggleFavorite(index),
              ),
            ],
          ),
        );
      },
    );
  }
}