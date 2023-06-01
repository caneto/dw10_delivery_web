import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/respository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/user_model.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<UserModel> getById(int id) async {
    try {
      final userRespose = await _dio.get('/users/$id');

      return UserModel.fromMap(userRespose.data);
    } on DioError catch (e,s) {
      log('Erro ao buscar o usuário', error: e, stackTrace: s);
      throw RespositoryException(message: 'Erro ao buscar usuário');
    }
  }
}
