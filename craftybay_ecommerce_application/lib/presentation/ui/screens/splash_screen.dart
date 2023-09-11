import 'package:craftybay_ecommerce_application/presentation/ui/screens/home_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/craftyBay_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: CraftyBayLogo(),
          ),
          Spacer(),
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text('Version 1.0.0'),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
