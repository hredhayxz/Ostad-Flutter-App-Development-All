import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_14_assignment/ui/screens/match_list_screen.dart';
import 'package:module_14_assignment/ui/utility/assets_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToMatchListScreen();
  }

  void navigateToMatchListScreen() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      Get.offAll(() => const MatchListScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset(
          AssetsUtils.logo,
          width: 400,
          fit: BoxFit.scaleDown,
        ),
      )),
    );
  }
}
