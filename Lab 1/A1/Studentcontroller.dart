import 'utils/import_export.dart';

class StudentController {
  StudentModel _student =
      StudentModel(name: "Malay Panara", enrollmentNo: "23010101184");

  StudentModel getStudent() {
    return _student;
  }
}
