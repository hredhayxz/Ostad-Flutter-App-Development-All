import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 1; i <= 6; i++)
                  ElevatedButton(
                    onPressed: () {
                      showSnackBar(context, 'Clicked on photo $i!');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',
                          fit: BoxFit.cover,
                          width: 105,
                          height: 105,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.black54,
                            child: Text(
                              'Photo $i Caption',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                for (int i = 1; i <= 3; i++)
                  ListTile(
                    leading: Image.network(
                      'https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                    title: Text('Photo $i'),
                    subtitle: Text('Subtitle for Photo $i'),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {
              showSnackBar(context, 'Photos Uploaded Successfully!');
            },
            child: const Icon(Icons.cloud_upload),
          ),
        ),
      ),
    );
  }
}
