import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
