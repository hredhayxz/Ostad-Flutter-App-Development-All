import 'package:flutter/material.dart';

class ReusableAppBar extends StatelessWidget {
  final String title;

  const ReusableAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      elevation: 0,
      leading: const BackButton(
        color: Colors.black,
      ),
    );
  }
}
