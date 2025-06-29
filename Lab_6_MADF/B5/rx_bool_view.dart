import 'package:lab/Lab_6_MADF/B5/utils/import_export.dart';

void main() {
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
      appBar: AppBar(title: Text("GetX RxBool Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.isVisible.value
                ? Text('Hello, this is visible.',
                    style: TextStyle(fontSize: 22))
                : SizedBox.shrink()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.toggleVisibility,
              child:
                  Obx(() => Text(controller.isVisible.value ? 'Hide' : 'Show')),
            ),
          ],
        ),
      ),
    );
  }
}
