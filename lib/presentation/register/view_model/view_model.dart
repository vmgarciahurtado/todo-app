import 'package:get/get.dart';
import 'package:todo_app/domain/register/service/register_service.dart';

class RegisterViewModel extends GetxController {
  final RegisterService userService;

  RegisterViewModel({required this.userService});
}
