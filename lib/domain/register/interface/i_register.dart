import 'package:todo_app/domain/register/model/user.dart';

abstract class IRegisterRepository {
  Future<bool> createUser(User user);
}
