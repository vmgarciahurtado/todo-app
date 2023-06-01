import 'package:todo_app/domain/register/interface/i_register.dart';
import 'package:todo_app/domain/register/model/user.dart';

class RegisterService {
  final IRegisterRepository iRegisterRepository;

  RegisterService({required this.iRegisterRepository});

  Future<bool> createUser(User user) async {
    return await iRegisterRepository.createUser(user);
  }
}
