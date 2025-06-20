import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassDataBetweenScreen2Getx extends StatelessWidget {
  const PassDataBetweenScreen2Getx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Data Between Screens using Getx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${Get.arguments['Name']}"),
            Text("Age: ${Get.arguments['age']}"),
            Text("Enrollment No.: ${Get.arguments['Enrollment No.']}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Go Back to First Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
