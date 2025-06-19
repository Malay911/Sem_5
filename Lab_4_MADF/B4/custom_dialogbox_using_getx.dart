// WAP to show Custom Dialog with different themes using Getx.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: CustomDialogboxUsingGetx(),
  ));
}

class CustomDialogboxUsingGetx extends StatelessWidget {
  const CustomDialogboxUsingGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Dialog Box using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                backgroundColor: Colors.white,
                title: const Text("Custom Dialog Title"),
                content: const Text("This is a custom dialog message."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
              barrierDismissible: true,
            );
          },
          child: const Text("Show Custom Dialog"),
        ),
      ),
    );
  }
}
