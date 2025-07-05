class SQLiteDatabaseModel {
  final int? id;
  final String name;
  final String enrollmentNumber;
  final double? grade12;
  final double? diplomaCgpa;
  final double currentCgpa;
  final String email;
  final String phone;
  final String city;

  SQLiteDatabaseModel({
    this.id,
    required this.name,
    required this.enrollmentNumber,
    this.grade12,
    this.diplomaCgpa,
    required this.currentCgpa,
    required this.email,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "enrollment_number": enrollmentNumber,
      "grade_12": grade12,
      "diploma_cgpa": diplomaCgpa,
      "current_cgpa": currentCgpa,
      "email": email,
      "phone": phone,
      "city": city,
    };
  }

  factory SQLiteDatabaseModel.fromMap(Map<String, dynamic> map) {
    return SQLiteDatabaseModel(
      id: map["id"],
      name: map["name"],
      enrollmentNumber: map["enrollment_number"],
      grade12: map["grade_12"],
      diplomaCgpa: map["diploma_cgpa"],
      currentCgpa: map["current_cgpa"],
      email: map["email"],
      phone: map["phone"],
      city: map["city"],
    );
  }
}
