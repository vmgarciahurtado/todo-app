import 'package:dio/dio.dart';
import 'package:todo_app/domain/register/interface/i_register.dart';
import 'package:todo_app/domain/register/model/user.dart';
import 'package:todo_app/infrastructure/api/firebase_api.dart';

class RegisterRepositoryHttp extends IRegisterRepository {
  @override
  Future<bool> createUser(User user) async {
    try {
      Response response = await Api.post('/user', user.toJson());
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
