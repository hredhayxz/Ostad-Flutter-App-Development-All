import 'package:flutter/material.dart';
import 'screens/CounterApp.dart';
import 'screens/SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterApp(),
      routes: {
        '/secondScreen': (context) => const SecondScreen(),
      },
    );
  }
}
