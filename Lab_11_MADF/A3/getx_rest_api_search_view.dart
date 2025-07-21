import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_11_MADF/A3/getx_rest_api_search_controller.dart';

void main() {
  runApp(const GetMaterialApp(
    home: GetxRestApiSearchView(),
    debugShowCheckedModeBanner: false,
  ));
}

class GetxRestApiSearchView extends StatelessWidget {
  const GetxRestApiSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetxRestApiController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search API with GetX'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => controller.filterData(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.dataList.isEmpty) {
                return const Center(child: Text('No data found.'));
              }

              return ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) {
                  final item = controller.dataList[index];
                  return ListTile(
                    title: Text(item.name ?? 'No Name'),
                    subtitle: Text(item.description ?? 'No Description'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
