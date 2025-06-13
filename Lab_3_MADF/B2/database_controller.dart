// WAP to do crud operation with Local database (TBL_USER(UID, Name, City, Gender)).

import 'utils/import_export.dart';

class DatabaseController {
  Future<void> addUser(DatabaseModel user) async {
    await DatabaseModel.insert(user);
  }

  Future<List<DatabaseModel>> getUsers() async {
    return await DatabaseModel.getAllUsers();
  }

  Future<void> updateUser(DatabaseModel user) async {
    await DatabaseModel.update(user);
  }

  Future<void> deleteUser(int uid) async {
    await DatabaseModel.delete(uid);
  }
}