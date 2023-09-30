import 'package:flutter/material.dart';
import 'package:flutter_news_reader/application/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  runApp(const ProviderScope(child: NewsReader()));
}
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/presentation/ui/screens/news_list_screen.dart';

class NewsReader extends StatelessWidget {
  const NewsReader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_model.dart';
import 'package:flutter_news_reader/presentation/ui/screens/news_details_screen.dart';
import 'package:flutter_news_reader/presentation/ui/widgets/news_card.dart';
import 'package:flutter_news_reader/provider/data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsListScreen extends ConsumerWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(DataProvider.articleDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          print("Refreshing data...");
          await ref.refresh(DataProvider.articleDataProvider);
          print("Data refreshed!");
        },
        child: data.when(
          data: (data) {
            List<ArticlesData> articles = data.map((e) => e).toList();
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(
                          article: articles[index],
                        ),
                      ),
                    );
                  },
                  child: NewsCard(
                    article: articles[index],
                  ),
                );
              },
            );
          },
          error: (error, _) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final ArticlesData article;
  const NewsCard({
    super.key, required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                  article.urlToImage.toString(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Icon(Icons.image),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      article.description.toString(),
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_reader/data/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticlesData article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title.toString()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage.toString(),
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Icon(Icons.image),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              article.title.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  article.publishedAt.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  'Author: ${article.author}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              article.content.toString(),
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Urls {
  Urls._();
  static  const String _apiKey = '1b0c488189474d3a83eca7bab5e2b77b';
  static  const String _apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';
  static  String getNews = _apiUrl+_apiKey;
}
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_news_reader/data/models/news_model.dart';
import 'package:flutter_news_reader/data/utility/urls.dart';
import 'package:http/http.dart';

class ApiServices {
  Future<List<ArticlesData>> getRequest() async {
    Response response = await get(Uri.parse(Urls.getNews));
    log(response.statusCode.toString());
    log(response.body);
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List result = decodedResponse['articles'];
      return result.map(((e) => ArticlesData.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
class ArticleData {
  String? status;
  int? totalResults;
  List<ArticlesData>? articles;

  ArticleData({this.status, this.totalResults, this.articles});

  ArticleData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesData>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticlesData {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesData(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  ArticlesData.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
import 'package:flutter_news_reader/data/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkProvider
{
  static final networkProvider = Provider<ApiServices>((ref) => ApiServices());
}
import 'package:flutter_news_reader/data/models/news_model.dart';
import 'package:flutter_news_reader/provider/network_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataProvider {
  static final articleDataProvider = FutureProvider<List<ArticlesData>>((ref) async =>
      ref.watch(NetworkProvider.networkProvider).getRequest());
}