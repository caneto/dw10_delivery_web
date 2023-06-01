import 'package:flutter/foundation.dart' show immutable;

import '../../models/product_model.dart';

@immutable
final class OrderProductDto {
  final ProductModel product;
  final int amount;
  final double totalPrice;

  const OrderProductDto({
    required this.product,
    required this.amount,
    required this.totalPrice,
  });
}
