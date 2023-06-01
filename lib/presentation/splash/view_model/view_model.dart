import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/presentation/home/view/home.dart';
import 'package:todo_app/presentation/auth/view/auth.dart';

class SplashViewModel {
  final storage = GetStorage();

  void verifySession() {
    if (storage.hasData('auth')) {
      Get.offAll(() => HomeView());
    } else {
      Get.offAll(() => AuthView());
    }
  }
}
