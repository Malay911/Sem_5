// WAP to Navigate between two screens using Get.to() & Get.back.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_5_MADF/A1/navigate_screen2.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavigateScreen1(),
  ));
}

class NavigateScreen1 extends StatelessWidget {
  const NavigateScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Screen 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const NavigateScreen2());
          },
          child: const Text("Go to Screen 2"),
        ),
      ),
    );
  }
}