import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShowdialogView(),
  ));
}

class ShowdialogView extends StatelessWidget {
  const ShowdialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dialog Box using Getx"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Dialog Box Title",
                  middleText: "This is an Alert Message",
                  textConfirm: "OK",
                  textCancel: "Cancel",
                  onConfirm: () {
                    Get.back();
                  },
                  onCancel: () {
                    Get.back();
                  });
            },
            child: Text("Show Dialog Box"),
          ),
        ));
  }
}
