import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/domain/register/interface/i_register.dart';
import 'package:todo_app/domain/register/model/user.dart';
import 'package:todo_app/infrastructure/api/firebase_api.dart';

class RegisterRepositoryHttp extends IRegisterRepository {
  @override
  Future<bool> createUser(User user) async {
    try {
      Response response = await Api.post('/user', user.toJson());
      if (response.statusCode == 201) {
        final storage = GetStorage();
        await storage.write('auth', user.id);
        await storage.write('user_name', user.name);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
