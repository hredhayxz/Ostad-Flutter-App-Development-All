import 'package:flutter/material.dart';
import 'package:module_10_live_test/screens/NewsFeedPage.dart';

class NewsArticleCard extends StatelessWidget {
  final NewsArticle newsArticle;

  const NewsArticleCard(this.newsArticle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(newsArticle.thumbnailUrl,height: 150,width: 150,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsArticle.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              newsArticle.description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}