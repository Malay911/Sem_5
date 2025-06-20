// WAP to Navigate between two screens using Get.to() & Get.back.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateScreen2 extends StatelessWidget {
  const NavigateScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Screen 2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Go to Screen 1"),
        ),
      ),
    );
  }
}
