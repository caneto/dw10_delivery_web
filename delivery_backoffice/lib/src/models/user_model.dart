import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
final class UserModel {
  final int id;
  final String name;
  final String email;

  const UserModel({
    this.id = 0,
    this.name = '',
    this.email = '',
  });

  Map<String, dynamic> toMap()  {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) =>UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
