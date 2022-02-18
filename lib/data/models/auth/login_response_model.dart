import 'dart:convert';

class LoginResponseModel {
  String? token;
  LoginResponseModel({
    this.token,
  });

  LoginResponseModel copyWith({
    String? token,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponseModel(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
