import 'package:flutter/material.dart';
import 'package:module_6_live_test/screens/shopping_list_page.dart';

/*
Author: Md Alhaz Mondal Hredhay
Student of Faridpur Polytechnic Institute
GitHub & Linkedin: hredhayxz
E-mail: amhredhay102@gmail.com
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 6 live test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingListPage(),
    );
  }
}

