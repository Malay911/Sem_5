// 3. WAP for implementation of a method overriding.

class Student {
  String name;
  String enrollmentNo;

  Student({
    required this.name,
    required this.enrollmentNo,
  });

  String getInfo() {
    return "Base Class - Name: $name, Enrollment No: $enrollmentNo";
  }
}

class CollegeStudent extends Student {
  String branch;

  CollegeStudent({
    required super.name,
    required super.enrollmentNo,
    required this.branch,
  });

  @override
  String getInfo() {
    return "College Student - Name: $name, Enrollment No: $enrollmentNo, Branch: $branch";
  }
}