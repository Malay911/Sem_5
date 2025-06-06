import 'utils/import_export.dart';

class StudentController {
  StudentModel getStudent() {
    return StudentModel(
        name: "Malay Panara", enrollmentNo: "23010101184", age: "19");
  }
}

class ExtendedStudentController extends StudentController {
  @override
  ExtendedStudentModel getStudent() {
    return ExtendedStudentModel(
        name: "Dhairya", enrollmentNo: "23010101075", age: "19");
  }

  void displayDetails() {
    var student = getStudent();
    print("Student's name is : ${student.name}");
    print("Student's enrollment no. is : ${student.enrollmentNo}");
    print("Student's age is : ${student.age}");
  }
}
