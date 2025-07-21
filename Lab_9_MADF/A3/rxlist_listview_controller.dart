import 'utils/import_export.dart';

class SQLiteDisplayRXListController extends GetxController {
  RxList<SQLiteDisplayRXListModel> studentList =
      <SQLiteDisplayRXListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllStudents();
  }

  Future<void> fetchAllStudents() async {
    final db = await SQLiteDisplayRXListDatabase.instance.database;
    final result = await db.query("Student");
    studentList.value =
        result.map((e) => SQLiteDisplayRXListModel.fromMap(e)).toList();
  }

  Future<void> addSampleStudent() async {
    final db = await SQLiteDisplayRXListDatabase.instance.database;

    final student = SQLiteDisplayRXListModel(
      name: "Malay",
      enrollmentNumber: "23010101184",
      grade12: 89.5,
      currentCgpa: 8.58,
      email: "malay@example.com",
      phone: "9876543210",
      city: "Rajkot",
    );

    await db.insert("Student", student.toMap());
    fetchAllStudents();
  }

  Future<void> deleteAll() async {
    final db = await SQLiteDisplayRXListDatabase.instance.database;
    await db.delete("Student");
    fetchAllStudents();
  }
}
