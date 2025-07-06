import 'utils/import_export.dart';

class SQLiteDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'student_university.db');
    return await openDatabase(
      path,
      version: 5,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('PRAGMA foreign_keys = ON');
          await db.execute('''
          CREATE TABLE TBL_University (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            city TEXT NOT NULL
          )
        ''');
          await db.execute('''
          CREATE TABLE TBL_Student (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            enrollment_number TEXT NOT NULL,
            grade_12 REAL,
            diploma_cgpa REAL,
            current_cgpa REAL NOT NULL,
            email TEXT NOT NULL,
            phone TEXT NOT NULL,
            city TEXT NOT NULL,
            university_id INTEGER,
            FOREIGN KEY (university_id) REFERENCES University(id) ON DELETE CASCADE
          )
        ''');
        }
      },
      onCreate: (db, version) async {
        await db.execute('PRAGMA foreign_keys = ON');
        await db.execute('''
          CREATE TABLE University (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            city TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE Student (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            enrollment_number TEXT NOT NULL,
            grade_12 REAL,
            diploma_cgpa REAL,
            current_cgpa REAL NOT NULL,
            email TEXT NOT NULL,
            phone TEXT NOT NULL,
            city TEXT NOT NULL,
            university_id INTEGER,
            FOREIGN KEY (university_id) REFERENCES University(id) ON DELETE CASCADE
          )
        ''');
      },
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }
}
