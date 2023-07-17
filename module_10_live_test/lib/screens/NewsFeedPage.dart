import 'package:flutter/material.dart';
import 'package:module_10_live_test/screens/Style.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewsArticle> newsArticles = [
      NewsArticle(
        'Article 1',
        'Description for article 1',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 2',
        'Description for article 2',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),
      NewsArticle(
        'Article 3',
        'Description for article 3',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 4',
        'Description for article 2',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 4',
        'Description for article 1',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 5',
        'Description for article 5',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 6',
        'Description for article 6',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 7',
        'Description for article 7',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 8',
        'Description for article 8',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 9',
        'Description for article 9',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 10',
        'Description for article 10',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 11',
        'Description for article 11',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 12',
        'Description for article 12',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 13',
        'Description for article 13',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 14',
        'Description for article 14',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 15',
        'Description for article 15',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),NewsArticle(
        'Article 16',
        'Description for article 16',
        'https://media.istockphoto.com/id/1279660339/photo/at-home-handsome-young-man-sits-at-his-desk-and-uses-smartphone-for-scrolling-technology-and.jpg?s=612x612&w=0&k=20&c=PAbWubCjM3VkGppXaSC__kFrkVp5ARoiO0ZmohSmdVM=',
      ),
      NewsArticle(
        'Article 17',
        'Description for article 17',
        'https://media.istockphoto.com/id/680767296/vector/news-feed.jpg?s=612x612&w=0&k=20&c=DXa6836xf3nYlZCL1aBXe0TXr9Dx6f6m2iTDNMEjtHY=',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
            childAspectRatio: orientation == Orientation.portrait ? 2 : 1.5,
            children: List.generate(newsArticles.length, (index) {
              return NewsArticleCard(newsArticles[index]);
            }),
          );
        },
      ),
    );
  }
}


class NewsArticle {
  final String title;
  final String description;
  final String thumbnailUrl;

  NewsArticle(this.title, this.description, this.thumbnailUrl);
}
