import 'dart:convert';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ username.hashCode ^ email.hashCode;
  }
}
