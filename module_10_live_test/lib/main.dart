import 'package:flutter/material.dart';
import 'package:module_10_live_test/screens/NewsFeedPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsFeedPage(),
    );
  }
}
