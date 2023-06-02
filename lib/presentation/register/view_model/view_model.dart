import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/register/model/user.dart';
import 'package:todo_app/domain/register/service/register_service.dart';
import 'package:todo_app/presentation/home/view/home.dart';
import 'package:todo_app/presentation/shared/cards/custom_loading.dart';
import 'package:uuid/uuid.dart';

class RegisterViewModel extends GetxController {
  final RegisterService registerService;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterViewModel({required this.registerService});

  String id = '';
  String name = '';
  String email = '';
  String password = '';

  Future<void> validateForm() async {
    if (formKey.currentState!.validate()) {
      CustomLoading(title: 'Loading..');
      id = const Uuid().v4();
      User user = User(id: id, name: name, email: email, password: password);
      bool create = await registerService.createUser(user);
      Get.back();
      if (create) {
        Get.offAll(() => HomeView());
      } else {
        Get.snackbar(
          'Error',
          'an error has occurred, check that the mail has not been created before.',
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.yellow.shade300,
        );
      }
    }
  }
}
