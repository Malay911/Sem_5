// WAP to show Custom SnackBar with different colors, and different locations after clicking on a button using Getx.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomSnackbarUsingGetx(),
  ));
}

class CustomSnackbarUsingGetx extends StatelessWidget {
  const CustomSnackbarUsingGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom SnackBar using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              "Custom SnackBar Title",
              "This is a custom SnackBar message",
              isDismissible: true,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
              icon: const Icon(Icons.info, color: Colors.white),
            );
          },
          child: const Text("Show Custom SnackBar"),
        ),
      ),
    );
  }
}
