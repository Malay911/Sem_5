// WAP to navigate between screens using a named route.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_5_MADF/A3/navigate_screen2_namedroute.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => const NavigateScreen1NamedRoute()),
      GetPage(name: '/screen2', page: () => const NavigateScreen2NamedRoute()),
    ],
  ));
}

class NavigateScreen1NamedRoute extends StatelessWidget {
  const NavigateScreen1NamedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Screen 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/screen2');
          },
          child: const Text("Go to Screen 2"),
        ),
      ),
    );
  }
}
