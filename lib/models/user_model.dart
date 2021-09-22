class UserModel {
  String id;
  String email;
  String password;
  String name;
  String goal;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.goal,
  });
  factory UserModel.fromJson(json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      name: json["name"],
      goal: json["goal"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "password": password,
      "name": name,
      "goal": goal
    };
  }
}
