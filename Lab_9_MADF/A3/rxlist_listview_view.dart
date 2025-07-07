import 'utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    home: SQLiteDisplayRXListView(),
    debugShowCheckedModeBanner: false,
  ));
}

class SQLiteDisplayRXListView extends StatelessWidget {
  SQLiteDisplayRXListView({super.key});

  final controller = Get.put(SQLiteDisplayRXListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite RXList ListView Example"),
      ),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          return Center(
            child: Text(
              "No Students Found",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final s = controller.studentList[index];
            return ListTile(
              title: Text(s.name),
              subtitle: Text("City: ${s.city} | CGPA: ${s.currentCgpa}"),
              trailing: Text(s.enrollmentNumber),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addSampleStudent,
        child: const Icon(Icons.add),
        tooltip: 'Add Sample Student',
      ),
    );
  }
}
