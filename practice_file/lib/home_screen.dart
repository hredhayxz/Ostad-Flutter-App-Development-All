import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          // Display the rating value as text
          Row(
            children: [
              Text(
                '4.5',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.star),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: screenSize.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(
                        color: Colors.yellow,
                        width: 2.0, // Set the border width as needed
                      ),
                    ),
                    child: Image.network(
                        'https://storage.googleapis.com/pod_public/1300/168838.jpg',
                        fit: BoxFit.scaleDown),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network(
                          'https://storage.googleapis.com/pod_public/1300/168838.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network(
                          'https://storage.googleapis.com/pod_public/1300/168838.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network(
                          'https://storage.googleapis.com/pod_public/1300/168838.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network(
                          'https://storage.googleapis.com/pod_public/1300/168838.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Illustration Gaming Controller Neon Playstation',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50, // Adjust the height as needed
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eleifend tortor nec nibh varius volutpat. Fusce feugiat urna vel mauris lacinia, in bibendum justo dapibus. Integer a ipsum nec tellus tincidunt rhoncus ac eu nulla. Sed laoreet erat id volutpat. Vivamus at tortor at erat interdum condimentum vel eget ex. Proin tristique a turpis a vulputate. Curabitur hendrerit est auctor, vehicula lectus et, feugiat orci. Vivamus euismod sapien in arcu hendrerit bibendum',style: TextStyle(fontSize: 25,),),
            ],
          ),
        ),
      ),
    );
  }
}
