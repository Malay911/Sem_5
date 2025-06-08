class StudentModel {
  String name;
  String enrollmentNo;
  String age;

  StudentModel({
    required this.name,
    required this.enrollmentNo,
    required this.age,
  });
}

class ExtendedStudentModel extends StudentModel {
  ExtendedStudentModel({
    required String name,
    required String enrollmentNo,
    required String age,
  }) : super(
          name: name,
          enrollmentNo: enrollmentNo,
          age: age,
        );
}
