import 'dart:convert';

class UserInfo {
  int? userId;
  String? name;
  String? email;
  String? password;

  UserInfo({
    this.userId,
    this.name,
    this.email,
    this.password,
  });

  UserInfo copyWith({
    int? userId,
    String? name,
    String? email,
    String? password,
  }) =>
      UserInfo(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "password": password,
      }..removeWhere((_, v) => v == null);
}
