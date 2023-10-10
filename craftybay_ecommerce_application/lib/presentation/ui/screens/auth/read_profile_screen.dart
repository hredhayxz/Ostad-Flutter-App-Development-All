import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadProfileScreen extends StatefulWidget {
  const ReadProfileScreen({super.key});

  @override
  State<ReadProfileScreen> createState() => _ReadProfileScreenState();
}

class _ReadProfileScreenState extends State<ReadProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ReadProfileController>().readProfileData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ReadProfileController>(
        builder: (readProfileController) {
          if(readProfileController.readProfileInProgress)
          {
            return CircularProgressIndicator();
          }
          return Container(
            height: 100,
            width: 100,
            color: Colors.red,
          );
        }
      ),
    );
  }
}
