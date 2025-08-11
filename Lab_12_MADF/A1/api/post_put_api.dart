import 'package:get/get.dart';
import 'package:lab/Lab_12_MADF/A1/post_put_model.dart';

class StudentPostPutApiService extends GetConnect {
  final String baseUrl = 'API_LINK';

  Future<Response> fetchStudents() => get(baseUrl);

  Future<Response> addStudent(StudentPostPutModel student) =>
      post(baseUrl, student.toJson());

  Future<Response> updateStudent(String id, StudentPostPutModel student) =>
      put('$baseUrl/$id', student.toJson());
}