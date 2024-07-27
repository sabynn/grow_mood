class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePic,
  });

  String id;
  String username;
  String email;
  String profilePic;

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
    id: id,
    username: json["username"],
    email: json["email"],
    profilePic: json["profilePic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "profilePic": profilePic,
  };
}
