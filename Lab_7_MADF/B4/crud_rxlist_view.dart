import 'utils/import_export.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: CrudRxListView(),
  ));
}

class CrudRxListView extends StatelessWidget {
  const CrudRxListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CrudController());
    final titleController = TextEditingController();
    final descController = TextEditingController();

    void showFormDialog({int? index}) {
      final isEditing = index != null;
      if (isEditing) {
        titleController.text = controller.items[index]['title'];
        descController.text = controller.items[index]['description'];
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(isEditing ? 'Edit Item' : 'Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  if (isEditing) {
                    controller.updateItem(
                      index,
                      titleController.text,
                      descController.text,
                    );
                  } else {
                    controller.addItem(
                      titleController.text,
                      descController.text,
                    );
                  }
                  titleController.clear();
                  descController.clear();
                  Navigator.pop(context);
                }
              },
              child: Text(isEditing ? 'Update' : 'Add'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD with RxList<Map>'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item['title']),
              subtitle: Text(item['description']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => showFormDialog(index: index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteItem(index),
                  ),
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showFormDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}