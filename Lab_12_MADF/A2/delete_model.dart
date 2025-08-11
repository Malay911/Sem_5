class StudentDeleteApiModel {
  final String? id;
  final String name;
  final int age;
  final String email;

  StudentDeleteApiModel(
      {this.id, required this.name, required this.age, required this.email});

  factory StudentDeleteApiModel.fromJson(Map<String, dynamic> json) =>
      StudentDeleteApiModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "email": email,
      };
}
