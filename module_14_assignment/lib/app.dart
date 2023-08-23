import 'package:flutter/material.dart';
import 'package:module_14_assignment/ui/screens/splash_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Score App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}