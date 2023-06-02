import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

import 'package:todo_app/domain/register/service/register_service.dart';
import 'package:todo_app/infrastructure/register/user_repository_http.dart';

import 'package:todo_app/presentation/register/view_model/view_model.dart';
import 'package:todo_app/presentation/shared/buttons/rounded_button.dart';
import 'package:todo_app/presentation/shared/inputs/custom_input.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final viewModel = Get.put(RegisterViewModel(
      registerService:
          RegisterService(iRegisterRepository: RegisterRepositoryHttp())));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
        child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyles.titleStyle(),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your name';
                    }
                    if (value.length < 3) {
                      return 'Invalid name';
                    }
                    return null;
                  },
                  onChanged: (value) => viewModel.name = value,
                  style: const TextStyle(color: Colors.grey),
                  decoration: CustomInput.roundedInputDecoration(
                      hint: 'Enter your name',
                      label: 'Name',
                      icon: CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onChanged: (value) => viewModel.email = value,
                  style: const TextStyle(color: Colors.grey),
                  decoration: CustomInput.roundedInputDecoration(
                      hint: 'Enter your email',
                      label: 'Email',
                      icon: CupertinoIcons.mail),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) => viewModel.password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                  obscureText: true,
                  style: const TextStyle(color: Colors.grey),
                  decoration: CustomInput.roundedInputDecoration(
                      hint: '**********',
                      label: 'Password',
                      icon: Icons.lock_outline_rounded),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          viewModel.validateForm();
                        },
                        text: 'Register',
                        backgroundColor: Colores.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
