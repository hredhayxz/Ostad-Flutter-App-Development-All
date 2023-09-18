import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, this.icon,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icon),
          ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}