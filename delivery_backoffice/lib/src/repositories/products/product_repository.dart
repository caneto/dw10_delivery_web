import 'dart:typed_data';

import '../../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> finalAll(String? name);
  Future<ProductModel> getProduct(int id);
  Future<void> save(ProductModel productModel);
  Future<String> uploadImageProduct(Uint8List file, String filename);
  Future<void> deletePRoduct(int id);
}