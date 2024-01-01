import 'dart:convert';

class User {
  String? name;
  String? email;
  String? password;
  int? id;

  User({this.name, this.email, this.password, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
    };
  }

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password, id: $id}';
  }

  @override
  bool operator ==(Object other) => other is User && id == other.id;

  @override
  int get hashCode => id.hashCode;

  User copyWith({
    String? name,
    String? email,
    String? password,
    int? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }
}
