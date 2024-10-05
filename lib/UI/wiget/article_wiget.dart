import 'package:flutter/material.dart';
import 'package:news_app/data/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleWiget extends StatelessWidget {
  const ArticleWiget({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () async {
          await launch(article.url ?? '');
        },
        title: Text(article.title ?? 'No title'),
        subtitle: Text(article.description ?? 'No description'),
        trailing: Text(
          article.author ?? 'No author',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
