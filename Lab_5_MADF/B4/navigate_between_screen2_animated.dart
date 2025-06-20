import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateBetweenScreen2Animated extends StatelessWidget {
  const NavigateBetweenScreen2Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Between Screens with Animation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Go Back to Previous Screen"),
        ),
      ),
    );
  }
}