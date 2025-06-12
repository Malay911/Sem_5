// WAP to do crud operation with Local database (TBL_USER(UID, Name, City, Gender)).

import 'database_modal.dart';

class DatabaseController {
  final dbHelper = DatabaseHelper();

  Future<void> insertUser(DatabaseModel user) async {
    final db = await dbHelper.database;
    await db.insert(
      'TBL_USER',
      user.toMap(),
    );
  }

  Future<List<DatabaseModel>> getUsers() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('TBL_USER');
    return List.generate(maps.length, (i) => DatabaseModel.fromMap(maps[i]));
  }

  Future<void> updateUser(DatabaseModel user) async {
    final db = await dbHelper.database;
    await db.update(
      'TBL_USER',
      user.toMap(),
      where: 'uid = ?',
      whereArgs: [user.uid],
    );
  }

  Future<void> deleteUser(int uid) async {
    final db = await dbHelper.database;
    await db.delete(
      'TBL_USER',
      where: 'uid = ?',
      whereArgs: [uid],
    );
  }
}
