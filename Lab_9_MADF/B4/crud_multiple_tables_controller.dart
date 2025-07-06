import 'utils/import_export.dart';

class DatabaseController extends GetxController {
  RxList<University> universities = <University>[].obs;
  RxList<SQLiteDatabaseModel> students = <SQLiteDatabaseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUniversity();
    fetchStudents();
  }

  Future<void> fetchStudents() {
    final db = SQLiteDatabase.database;
    return db.then((database) async {
      final result = await database.query("TBL_Student");
      students.value =
          result.map((json) => SQLiteDatabaseModel.fromMap(json)).toList();
    });
  }

  Future<void> fetchUniversity() {
    final db = SQLiteDatabase.database;
    return db.then((database) async {
      final result = await database.query("TBL_University");
      universities.value =
          result.map((json) => University.fromMap(json)).toList();
    });
  }

  Future<void> addStudent(SQLiteDatabaseModel student) async {
    final db = await SQLiteDatabase.database;
    await db.insert("TBL_Student", student.toMap());
    fetchStudents();
  }

  Future<void> addUniversity(University university) async {
    final db = await SQLiteDatabase.database;
    await db.insert("TBL_University", university.toMap());
    fetchUniversity();
  }

  Future<void> deleteStudent(int id) async {
    final db = await SQLiteDatabase.database;
    await db.delete("TBL_Student", where: "id = ?", whereArgs: [id]);
    fetchStudents();
  }

  Future<void> deleteUniversity(int universityId) async {
    final db = await SQLiteDatabase.database;
    await db.delete('TBL_University', where: 'id = ?', whereArgs: [universityId]);
    fetchUniversity();
  }

  Future<void> updateStudent(SQLiteDatabaseModel student) async {
    final db = await SQLiteDatabase.database;
    await db.update("TBL_Student", student.toMap(),
        where: "id = ?", whereArgs: [student.id]);
    fetchStudents();
  }

  Future<void> updateUniversity(University university) async {
    final db = await SQLiteDatabase.database;
    await db.update("TBL_University", university.toMap(),
        where: "id = ?", whereArgs: [university.id]);
    fetchUniversity();
  }
}
