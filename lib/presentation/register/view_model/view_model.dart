import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/register/model/user.dart';
import 'package:todo_app/domain/register/service/register_service.dart';
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
      CustomLoading(title: 'Cargando..');
      id = const Uuid().v4();
      User user = User(id: id, name: name, email: email, password: password);
      await registerService.createUser(user);
      Get.back();
    }
  }
}
