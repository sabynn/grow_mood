class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  String id;
  String email;
  String name;

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
    id: id,
    email: json["email"],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
  };
}
