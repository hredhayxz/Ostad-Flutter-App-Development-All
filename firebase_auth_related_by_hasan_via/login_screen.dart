import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Login success',
        message: ' ',
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
      //Get.to(LoginScreen2());
    }).onError((error, stackTrace) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Login Failed',
        message: ' ',
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (String? value) {
                    if (value?.trim()?.isEmpty ?? true) {
                      return 'Enter email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Email', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (String? value) {
                    if (value?.trim()?.isEmpty ?? true) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Password', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}