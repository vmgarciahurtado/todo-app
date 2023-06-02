import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/auth/service/auth_service.dart';

class AuthViewModel extends GetxController {
  final AuthService authService;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  AuthViewModel({required this.authService});

  Future<void> validateForm() async {
    if (formKey.currentState!.validate()) {}
  }
}
