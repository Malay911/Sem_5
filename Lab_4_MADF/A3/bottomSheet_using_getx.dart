// WAP to show the BottomSheet dialog with a list of data in it.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomsheetUsingGetx(),
  ));
}

class BottomsheetUsingGetx extends StatelessWidget {
  const BottomsheetUsingGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheet using Getx"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item ${index + 1}"),
                      onTap: () {
                        Get.back();
                      },
                    );
                  },
                ),
              ),
              isDismissible: true,
              enableDrag: true,
              backgroundColor: Colors.white,
              barrierColor: Colors.black54,
            );
          },
          child: const Text("Show BottomSheet"),
        ),
      ),
    );
  }
}
