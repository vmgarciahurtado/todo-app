import 'package:todo_app/domain/auth/interface/i_auth.dart';

class AuthService {
  IAuthRepository iAuthRepository;

  AuthService({required this.iAuthRepository});

  Future<bool> login(String email, String password) async {
    return await iAuthRepository.login(email, password);
  }
}
