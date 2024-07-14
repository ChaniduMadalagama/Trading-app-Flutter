class UserModel {
  final String username;
  final String email;
  final int user_id;

  UserModel({
    required this.username,
    required this.email,
    required this.user_id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      user_id: json['user_id'],
    );
  }
}
