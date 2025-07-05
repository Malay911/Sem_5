import 'utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: sqlite_student_map_model(),
  ));
}

class sqlite_student_map_model extends StatelessWidget {
  final SQLiteDatabaseMapController  controller =
      Get.put(SQLiteDatabaseMapController ());

  sqlite_student_map_model({super.key});

  void addSample() {
    final student = SQLiteDatabaseMapModel(
      name: "Malay",
      enrollmentNumber: "23010101184",
      grade12: 89.5,
      currentCgpa: 8.58,
      email: "malay@example.com",
      phone: "9876543210",
      city: "Rajkot",
    );
    controller.addStudent(student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite Database View"),
      ),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          return Center(
            child: Text(
              "No students found. Please add some.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final student = controller.studentList[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('${student.city} | CGPA: ${student.currentCgpa}'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addSample,
        child: const Icon(Icons.add),
      ),
    );
  }
}
