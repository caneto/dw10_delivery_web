import 'dart:convert';
import 'package:flutter/material.dart' show immutable;

@immutable
final class PaymentTypeModel {
  final int? id;
  final String name;
  final String acronym;
  final bool enabled;

  const PaymentTypeModel({
    this.id,
    required this.name,
    required this.acronym,
    required this.enabled,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'acronym': acronym,
        'enabled': enabled,
      };

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) =>
      PaymentTypeModel(
        id: map['id']?.toInt(),
        name: map['name'] ?? '',
        acronym: map['acronym'] ?? '',
        enabled: map['enabled'] ?? false,
      );

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromMap(json.decode(source));
}
