import 'utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const RxStringView(),
  ));
}

class RxStringView extends StatelessWidget {
  const RxStringView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RxStringController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('RxString Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: controller.clearText,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: controller.updateText,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Real-time Preview:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => Text(
              controller.text.value,
              style: const TextStyle(fontSize: 24),
            )),
          ],
        ),
      ),
    );
  }
}