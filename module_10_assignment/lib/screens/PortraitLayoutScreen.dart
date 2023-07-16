import 'package:flutter/material.dart';

class PortraitLayoutScreen extends StatelessWidget {
  const PortraitLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: screenSize.width / 2,
                  child: CircleAvatar(
                    radius: (screenSize.width / 2) - 10,
                    backgroundImage: const NetworkImage(
                        'https://pbs.twimg.com/profile_images/1587842939203760128/w19OfHDG_400x400.jpg'),
                  ),
                ),
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
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Hi there 👋\nI am Md Alhaz Mondal Hredhay. I am currently working on Mobile Development. As mobile app devleoper I use Flutter which is a framework for cross platform native app development and I really love it.',
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: const ScrollPhysics(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: [
                for (int i = 1; i <= 10; i++)
                  Image.network(
                    'https://he-s3.s3.amazonaws.com/media/avatars/hredhayxz/resized/200/5be5e34alhaz.jpg',
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
