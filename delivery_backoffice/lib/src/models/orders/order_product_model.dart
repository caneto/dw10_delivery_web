import 'dart:convert';
import 'package:flutter/foundation.dart' show immutable;

@immutable
final class OrderProductModel {
  final int productId;
  final int amount;
  final double totalPrice;

  const OrderProductModel({
    required this.productId,
    required this.amount,
    required this.totalPrice,
  });
  

  Map<String, dynamic> toMap() => {
      'id': productId,
      'amount': amount,
      'total_price': totalPrice,
    };
  
  factory OrderProductModel.fromMap(Map<String, dynamic> map) => OrderProductModel(
      productId: map['id']?.toInt() ?? 0,
      amount: map['amount']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toDouble() ?? 0.0,
    );
  
  String toJson() => json.encode(toMap());

  factory OrderProductModel.fromJson(String source) => OrderProductModel.fromMap(json.decode(source));
}
