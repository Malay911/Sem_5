import 'package:lab/Lab_6_MADF/B5/utils/import_export.dart';

void main() {
  Get.put(GetXRxBoolController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetXRxBoolView(),
  ));
}

class GetXRxBoolView extends StatelessWidget {
  final GetXRxBoolController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX RxBool Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => AnimatedOpacity(
                  opacity: controller.isVisible.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    'Hello, this is visible.',
                    style: TextStyle(fontSize: 22),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.toggleVisibility,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: Obx(() => Text(
                    controller.isVisible.value ? 'Hide' : 'Show',
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
