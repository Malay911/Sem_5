import 'package:lab/Lab_6_MADF/A2/utils/import_export.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RxVariableView(),
    ),
  );
}

class RxVariableView extends StatelessWidget {
  const RxVariableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rx Variables with Obx() & Obs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final count = 0;
              return Text(
                'Count: $count',
                style: const TextStyle(fontSize: 24),
              );
            }),
            const SizedBox(height: 20),
            Obx(() {
              final message = 'Initial Message';
              return Text(
                message,
                style: const TextStyle(fontSize: 16),
              );
            }),
          ],
        ),
      ),
    );
  }
}
