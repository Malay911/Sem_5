import 'utils/import_export.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: RxListFavouriteView(),
  ));
}

class RxListFavouriteView extends StatelessWidget {
  const RxListFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RxListFavouriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite List Demo'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: item.isFavourite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => controller.toggleFavourite(index),
                ),
              );
            },
          )),
    );
  }
}
