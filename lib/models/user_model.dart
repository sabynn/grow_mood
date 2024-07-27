class UserModel {
  UserModel({
    required this.id,
    required this.email,
  });

  String id;
  String email;

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
    id: id,
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
  };
}
