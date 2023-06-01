import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/auth/service/auth_service.dart';
import 'package:todo_app/infrastructure/auth/auth_repository_http.dart';
import 'package:todo_app/presentation/auth/view_model/view_model.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final viewModel = Get.put(AuthViewModel(
      authService: AuthService(iAuthRepository: AuthRepositoryHttp())));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('LOGIN'),
      ),
    );
  }
}
