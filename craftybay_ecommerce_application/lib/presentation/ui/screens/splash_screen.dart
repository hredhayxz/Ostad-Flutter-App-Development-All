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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: CtaftyBayLogo()),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 16,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}