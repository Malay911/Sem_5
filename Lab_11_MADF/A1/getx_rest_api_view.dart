import 'utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    home: GetxRestApiView(),
  ));
}

class GetxRestApiView extends StatelessWidget {
  final GetxRestApiController controller = Get.put(GetxRestApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX REST API Example'),
      ),
      body: Obx(() {
        if (controller.dataList.isEmpty) {
          return Center(child: Text('No data found'));
        }

        return ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            GetxRestApiModel item = controller.dataList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(item.id.toString()),
                ),
                title: Text(item.name ?? 'No Name'),
                subtitle: Text(item.description ?? 'No Description'),
              ),
            );
          },
        );
      }),
    );
  }
}
