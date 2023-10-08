import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(35, 42, 43, 1),
      ),
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete),
                        const VerticalDivider(
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Meta",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.amber,
                                ),
                                children: [
                                  TextSpan(text: "  "),
                                  TextSpan(
                                    text: "Collaboration",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                text: "With",
                                style: TextStyle(fontSize: 18),
                                children: [
                                  TextSpan(text: "  "),
                                  TextSpan(
                                    text: "Pranayama",
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(47, 58, 59, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "You are now using",
                    style: TextStyle(color: Colors.white),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Pranayama",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(text: "  "),
                        TextSpan(
                          text: "Plus+",
                          style: TextStyle(
                            fontFamily: "Pacifico",
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('End: 18 july 2025',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
