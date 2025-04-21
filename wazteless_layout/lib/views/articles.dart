import 'package:flutter/material.dart';
import 'package:wazteless_layout/models/articlemodel.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<ArticleModel>? articles;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    try {
      final String response =
          await rootBundle.loadString('lib/models/articlesdata.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        articles = data
            .map((json) => ArticleModel.fromJson(json as Map<String, dynamic>))
            .toList();
        isLoaded = true;
      });
    } catch (e) {
      print('Error loading articles: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.article),
            SizedBox(width: 10),
            Text('Articles'),
          ],
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: articles?.length ?? 0,
          itemBuilder: (context, index) {
            final article = articles?[index];
            if (article == null) {
              return const SizedBox(); // Skip rendering if the article is null
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailPage(article: article),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(article.body ?? 'No Content'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'No Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              article.body ?? 'No Content',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
