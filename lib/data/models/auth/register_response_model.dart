import 'dart:convert';

class RegisterResponseModel {
  String? token;
  RegisterResponseModel({
    this.token,
  });

  RegisterResponseModel copyWith({
    String? token,
  }) {
    return RegisterResponseModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory RegisterResponseModel.fromMap(Map<String, dynamic> map) {
    return RegisterResponseModel(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromJson(String source) =>
      RegisterResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'RegisterResponseModel(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterResponseModel && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
