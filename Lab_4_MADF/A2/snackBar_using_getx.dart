// WAP to show SnackBar after clicking on a button using Getx.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SnackbarView(),
  ));
}

class SnackbarView extends StatelessWidget {
  const SnackbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "SnackBar Title",
              "This is a SnackBar message",
              isDismissible: true,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.blue,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
          },
          child: const Text("Show SnackBar"),
        ),
      ),
    );
  }
}