// WAP to perform CRUD operations with List<dynamic>.

// class StudentModel {
//   String name;
//   String email;

//   StudentModel({
//     required this.name,
//     required this.email,
//   });
// }

// class StudentList {
//   static List<StudentModel> students = [];

//   static void addStudent(StudentModel student) {
//     students.add(student);
//   }

//   static void updateStudent(int index, StudentModel student) {
//     if (index >= 0 && index < students.length) {
//       students[index] = student;
//     }
//   }

//   static void deleteStudent(int index) {
//     if (index >= 0 && index < students.length) {
//       students.removeAt(index);
//     }
//   }

//   static List<StudentModel> getStudents() {
//     return List.unmodifiable(students);
//   }
// }

class StudentModel {
  String name;
  String email;

  StudentModel({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      email: map['email'],
    );
  }
}

class StudentList {
  static List<dynamic> students = [];

  static void addStudent(StudentModel student) {
    students.add(student.toMap());
  }

  static void updateStudent(int index, StudentModel student) {
    if (index >= 0 && index < students.length) {
      students[index] = student.toMap();
    }
  }

  static void deleteStudent(int index) {
    if (index >= 0 && index < students.length) {
      students.removeAt(index);
    }
  }

  static List<StudentModel> getStudents() {
    return students
        .map((dynamic item) =>
            StudentModel.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}
