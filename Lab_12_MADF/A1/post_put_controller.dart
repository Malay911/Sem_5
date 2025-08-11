import 'package:get/get.dart';
import 'package:lab/Lab_12_MADF/A1/api/post_put_api.dart';
import 'package:lab/Lab_12_MADF/A1/post_put_model.dart';

class StudentPostPutController extends GetxController {
  var students = <StudentPostPutModel>[].obs;
  final StudentPostPutApiService _api = StudentPostPutApiService();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    final response = await _api.fetchStudents();
    if (response.statusCode == 200) {
      students.value = (response.body as List)
          .map((e) => StudentPostPutModel.fromJson(e))
          .toList();
    }
  }

  void addStudent(StudentPostPutModel student) async {
    final response = await _api.addStudent(student);
    if (response.statusCode == 201) fetchStudents();
  }

  void updateStudent(String id, StudentPostPutModel student) async {
    final response = await _api.updateStudent(id, student);
    if (response.statusCode == 200) fetchStudents();
  }
}