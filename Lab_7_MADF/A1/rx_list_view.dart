import 'utils/import_export.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: RxListView(),
  ));
}

class RxListView extends StatelessWidget {
  const RxListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RxListController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('RxList Demo'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.items[index].name),
            leading: const Icon(Icons.arrow_right),
          );
        },
      )),
    );
  }
}