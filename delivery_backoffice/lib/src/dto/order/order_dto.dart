import 'package:flutter/foundation.dart' show immutable;

import '../../models/orders/order_status.dart';
import '../../models/user_model.dart';
import '../../models/payment_type_model.dart';
import 'order_product_dto.dart';

@immutable
final class OrderDto {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final UserModel user;
  final String address;
  final String cpf;
  final PaymentTypeModel paymentTypeModel;

  const OrderDto({
    required this.id,
    required this.date,
    required this.status,
    required this.orderProducts,
    required this.user,
    required this.address,
    required this.cpf,
    required this.paymentTypeModel,
  });
}
