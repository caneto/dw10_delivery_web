import 'dart:convert';

import 'order_product_model.dart';
import 'order_status.dart';

class OrderModel {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductModel> orderProducts;
  final int userId;
  final String address;
  final String cpf;
  final int paymentTypeId;

  OrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.userId,
    required this.address,
    required this.cpf,
    required this.paymentTypeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'status': status.acronym,
      'products': orderProducts.map((x) => x.toMap()).toList(),
      'user_id': userId,
      'address': address,
      'cpf': cpf,
      'payment_type_id': paymentTypeId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: (map['id'] ?? 0) as int,
      date: DateTime.parse(map['date']),
      status: OrderStatus.parse(map['status']),
      orderProducts: List<OrderProductModel>.from(
        (map['products']).map<OrderProductModel>(
          (x) => OrderProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      userId: map['user_id']?.toInt() ?? 0,
      address: map['address'] ?? '',
      cpf: map['cpf'] ?? '',
      paymentTypeId: map['payment_type_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
