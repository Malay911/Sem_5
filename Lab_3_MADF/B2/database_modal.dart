// WAP to do crud operation with Local database (TBL_USER(UID, Name, City, Gender)).

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseModel {
  final int? uid;
  final String name;
  final String city;
  final String gender;

  DatabaseModel({
    this.uid,
    required this.name,
    required this.city,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'city': city,
      'gender': gender,
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
      uid: map['uid'],
      name: map['name'],
      city: map['city'],
      gender: map['gender'],
    );
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TBL_USER(
            uid INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            city TEXT NOT NULL,
            gender TEXT NOT NULL
          )
        ''');
      },
    );
  }
}

