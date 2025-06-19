// WAP to show custom bottom sheets with different heights and auto close after few seconds using getx.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomBottomsheetUsigGetx(),
  ));
}

class CustomBottomsheetUsigGetx extends StatelessWidget {
  const CustomBottomsheetUsigGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Bottom Sheet using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.blueAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "This is a custom bottom sheet",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Close Bottom Sheet"),
                    ),
                  ],
                ),
              ),
              isDismissible: true,
              enableDrag: true,
            );
            Future.delayed(Duration(seconds: 3), () {
              Get.back();
            });
          },
          child: const Text("Click the button to show bottom sheet"),
        ),
      ),
    );
  }
}
