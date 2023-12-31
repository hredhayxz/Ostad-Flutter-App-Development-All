import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/carts_screen.dart';
import 'package:hello/check_out_screen.dart';
import 'package:hello/counter_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home'),
            ElevatedButton(
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CartsScreen(),
                //   ),
                // );
                // getx navigation
                // Context-less navigation
                final Params? result = await Get.to(const CartsScreen());
                if (result != null) {
                  print(result.name);
                  print(result.age);
                }
              },
              child: const Text('Carts'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(const CheckOutScreen(message: 'Hello world',));
              },
              child: const Text('Check-out'),
            ),
            ElevatedButton(
              onPressed: () {
                _counterController.increment(1);
                Get.to(CounterScreen());
              },
              child: const Text('Counter screen'),
            ),
          ],
        ),
      ),
    );
  }
}