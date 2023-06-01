import 'package:dio/dio.dart';
import 'package:todo_app/domain/auth/interface/i_auth.dart';
import 'package:todo_app/domain/register/model/user.dart';
import 'package:todo_app/infrastructure/api/firebase_api.dart';

class AuthRepositoryHttp extends IAuthRepository {
  @override
  Future<bool> login(String email, String password) async {
    final data = {'email': email, 'password': password};
    try {
      Response response = await Api.post('/login', data);
      User user = User.fromJson(response.data);
      print(user);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
