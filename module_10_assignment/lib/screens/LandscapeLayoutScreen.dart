import 'package:flutter/material.dart';

class LandscapeLayoutScreen extends StatelessWidget {
  const LandscapeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: screenSize.width / 6,
            child: CircleAvatar(
              radius: (screenSize.width / 6) - 2,
              backgroundImage: const NetworkImage(
                'https://pbs.twimg.com/profile_images/1587842939203760128/w19OfHDG_400x400.jpg',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Md Alhaz Mondal Hredhay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Competitive Programmer, Flutter Developer',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Hi there 👋\nI am Md Alhaz Mondal Hredhay. I am currently working on Mobile Development. As a mobile app developer, I use Flutter, which is a framework for cross-platform native app development, and I really love it.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://he-s3.s3.amazonaws.com/media/avatars/hredhayxz/resized/200/5be5e34alhaz.jpg',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
