import 'package:flutter/material.dart';
import 'package:module_14_assignment/ui/screens/splash_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Score App',
      home: SplashScreen(),
    );
  }
}