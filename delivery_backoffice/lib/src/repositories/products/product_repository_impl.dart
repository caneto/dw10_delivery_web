import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/respository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio _dio;
  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deletePRoduct(int id) async {
    try {
      await _dio.auth().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioError catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao deletar produto');
    }
  }

  @override
  Future<List<ProductModel>> finalAll(String? name) async {
    try {
      final productResult = await _dio.auth().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );

      return productResult.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final productResult = await _dio.auth().get(
            '/products/$id',
          );

      return ProductModel.fromMap(productResult.data);
    } on DioError catch (e, s) {
      log('Erro ao busca produto $id', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao busca produto $id');
    }
  }

  @override
  Future<void> save(ProductModel productModel) async {
    try {
      final client = _dio.auth();
      final data = productModel.toMap();
      if (productModel.id != null) {
        await client.put('/products/${productModel.id}', data: data);
      } else {
        await client.post('/products', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImageProduct(Uint8List file, String filename) async {
    try {
      final formData = FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(file, filename: filename),
        },
      );

      final respose = await _dio.auth().post('/uploads', data: formData);

      return respose.data['url'];
    } on DioError catch (e,s) {
      log('Erro ao fazer upload do arquivo', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao fazer upload do arquivo');
    }
  }
}
