// WAP to do crud operation with Local database (TBL_USER(UID, Name, City, Gender)).

import 'database_modal.dart';

class DatabaseController {
  
  // Create
  Future<void> addUser(DatabaseModel user) async {
    await DatabaseModel.insert(user);
  }

  // Read
  Future<List<DatabaseModel>> getUsers() async {
    return await DatabaseModel.getAllUsers();
  }

  // Update
  Future<void> updateUser(DatabaseModel user) async {
    await DatabaseModel.update(user);
  }

  // Delete
  Future<void> deleteUser(int uid) async {
    await DatabaseModel.delete(uid);
  }
}