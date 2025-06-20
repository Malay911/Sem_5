// WAP to pass data between two screens using Get.to().

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_5_MADF/A2/pass_data_between_screen2_getx.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: PassDataBetweenScreen1Getx(),
  ));
}

class PassDataBetweenScreen1Getx extends StatelessWidget {
  const PassDataBetweenScreen1Getx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Data Between Screens using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const PassDataBetweenScreen2Getx(), arguments: {
              "Name": "Malay Panara",
              "age": 20,
              "Enrollment No.": 23010101184,
            });
          },
          child: const Text("Go to Second Screen"),
        ),
      ),
    );
  }
}
