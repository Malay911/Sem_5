import 'package:lab/Lab_6_MADF/B4/utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: GetXCountdownRxIntView(),
  ));
}

class GetXCountdownRxIntView extends StatelessWidget {
  final GetXCountdownRxIntController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Countdown RxInt Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Time Left: ${controller.seconds.value}s',
              style: TextStyle(fontSize: 32),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.startCountdown,
              child: Text('Start Countdown'),
            ),
          ],
        ),
      ),
    );
  }
}