import 'package:get/get.dart';
import 'package:todo_app/domain/auth/service/auth_service.dart';

class AuthViewModel extends GetxController {
  final AuthService authService;

  AuthViewModel({required this.authService});
}
