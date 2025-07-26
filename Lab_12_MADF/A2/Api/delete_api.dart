import 'package:get/get.dart';
import 'package:lab/Lab_12_MADF/A2/delete_model.dart';

class StudentDeleteApiService extends GetConnect {
  final String baseUrl = 'API_LINK';

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    allowAutoSignedCert = true;
  }

  Future<Response> fetchStudents() => get('users');

  Future<Response> addStudent(StudentDeleteApiModel student) =>
      post('users', student.toJson());

  Future<Response> updateStudent(String id, StudentDeleteApiModel student) =>
      put('users/$id', student.toJson());

  Future<Response> deleteStudent(String id) => delete('users/$id');
}
