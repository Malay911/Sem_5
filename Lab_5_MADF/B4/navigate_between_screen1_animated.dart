// WAP to transit between two screens with different animations.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_5_MADF/B4/navigate_between_screen2_animated.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavigateBetweenScreen1Animated(),
  ));
}

class NavigateBetweenScreen1Animated extends StatelessWidget {
  const NavigateBetweenScreen1Animated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Screen 1 with Animation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => const NavigateBetweenScreen2Animated(),
              transition: Transition.zoom,
              duration: const Duration(seconds: 1),
            );
          },
          child: const Text("Go to Screen 2"),
        ),
      ),
    );
  }
}
