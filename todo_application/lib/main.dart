import 'dart:developer';

import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

// TODO 1 - Button for switch theme

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  HomeScreen isChange = HomeScreen();

  final ThemeData _lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.amber,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.greenAccent
      )
  );
  final ThemeData _darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.red,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple
      )
  );


  @override
  Widget build(BuildContext context) {
    //Theme.of(context).brightness;
    print(Theme.of(context).brightness);
    return MaterialApp(
      theme: isChange.isThemeIconChange?_darkTheme:_lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Todo ',
      home: HomeScreen(),
    );
  }
}













