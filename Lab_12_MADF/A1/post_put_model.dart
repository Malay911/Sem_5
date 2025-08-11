import 'package:lab/Lab_12_MADF/A1/utils/strings.dart';

class StudentPostPutModel {
  final String? id;
  final String name;
  final int age;
  final String email;

  StudentPostPutModel({this.id, required this.name, required this.age, required this.email});

  factory StudentPostPutModel.fromJson(Map<String, dynamic> json) => StudentPostPutModel(
    id: json[COL_ID],
    name: json[COL_NAME],
    age: json[COL_AGE],
    email: json[COL_EMAIL],
  );

  Map<String, dynamic> toJson() => {
    COL_NAME: name,
    COL_AGE: age,
    COL_EMAIL: email,
  };
}