
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: screenSize.width-200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(
                      color: Colors.yellow,
                      width: 2.0, // Set the border width as needed
                    ),
                  ),
                  child: Image.network('https://storage.googleapis.com/pod_public/1300/168838.jpg',fit: BoxFit.scaleDown),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network('https://storage.googleapis.com/pod_public/1300/168838.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network('https://storage.googleapis.com/pod_public/1300/168838.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network('https://storage.googleapis.com/pod_public/1300/168838.jpg',fit: BoxFit.cover,),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.yellow,
                            width: 2.0, // Set the border width as needed
                          ),
                        ),
                        child: Image.network('https://storage.googleapis.com/pod_public/1300/168838.jpg',fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
