// WAP to Search API Integration with Real-time Filtering.

class GetxRestApiModel {
  int? id;
  String? name;
  String? description;

  GetxRestApiModel({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': name,
      'description': description,
    };
  }

  GetxRestApiModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
  }
}