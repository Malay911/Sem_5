import 'utils/import_export.dart';

class StudentController {
  List<Student> getStudents() {
    return [
      Student(
        name: "John Doe",
        enrollmentNo: "A001",
      ),
      CollegeStudent(
        name: "Jane Smith",
        enrollmentNo: "A002",
        branch: "Computer Science",
      ),
    ];
  }
}