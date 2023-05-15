import 'package:mobx/mobx.dart';

import '../../../repositories/products/product_repository.dart';

part 'product_controller.g.dart';

enum ProductStateStatus {
  initial,
  loading,
  loaded,
  error,
}


class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {

  final ProductRepository _productRepository;

  ProductControllerBase(this._productRepository);

}