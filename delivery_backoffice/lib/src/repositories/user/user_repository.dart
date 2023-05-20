import '../../models/orders/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getById(int id);
}