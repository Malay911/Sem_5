import 'utils/import_export.dart';

class SQLiteDatabaseController extends GetxController {
  var studentList = <SQLiteDatabaseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final db = await SQLiteDatabase.instance.database;
    final result = await db.query("Student");
    studentList.value =
        result.map((json) => SQLiteDatabaseModel.fromMap(json)).toList();
  }

  Future<void> addStudent(SQLiteDatabaseModel student) async {
    final db = await SQLiteDatabase.instance.database;
    await db.insert("Student", student.toMap());
    loadStudents();
  }
}
