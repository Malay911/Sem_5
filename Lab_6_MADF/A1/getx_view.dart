import 'utils/import_export.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetXDemoView(),
    ),
  );
}

class GetXDemoView extends StatelessWidget {
  GetXDemoView({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Non-Reactive Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reset,
          ),
        ],
      ),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count: ${controller.count}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                controller.message,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}