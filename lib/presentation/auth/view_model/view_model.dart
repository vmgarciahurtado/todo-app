import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/auth/service/auth_service.dart';
import 'package:todo_app/presentation/home/view/home.dart';
import 'package:todo_app/presentation/shared/cards/custom_loading.dart';

class AuthViewModel extends GetxController {
  final AuthService authService;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  AuthViewModel({required this.authService});

  Future<void> validateForm() async {
    if (formKey.currentState!.validate()) {
      CustomLoading(title: 'Cargando..');
      bool login = await authService.login(email, password);
      Get.back();
      if (login) {
        Get.offAll(() => HomeView());
      } else {
        Get.snackbar(
          'Error',
          'an error has occurred, check that the email and password are valid.',
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.yellow.shade300,
        );
      }
    }
  }
}
