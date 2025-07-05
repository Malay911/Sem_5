import 'utils/import_export.dart';

class SQLiteDatabaseMapController extends GetxController {
  var studentList = <SQLiteDatabaseMapModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final db = await SQLiteDatabaseMapDatabase.instance.database;
    final result = await db.query("Student");
    studentList.value =
        result.map((json) => SQLiteDatabaseMapModel.fromMap(json)).toList();
  }

  Future<void> addStudent(SQLiteDatabaseMapModel student) async {
    final db = await SQLiteDatabaseMapDatabase.instance.database;
    await db.insert("Student", student.toMap());
    fetchStudents();
  }
}
