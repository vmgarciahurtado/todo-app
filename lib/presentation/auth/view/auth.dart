import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/domain/auth/service/auth_service.dart';
import 'package:todo_app/infrastructure/auth/auth_repository_http.dart';
import 'package:todo_app/presentation/auth/view_model/view_model.dart';
import 'package:todo_app/presentation/register/view/register.dart';
import 'package:todo_app/presentation/shared/buttons/rounded_button.dart';
import 'package:todo_app/presentation/shared/inputs/custom_input.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final viewModel = Get.put(AuthViewModel(
      authService: AuthService(iAuthRepository: AuthRepositoryHttp())));

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
                  'Login',
                  style: TextStyles.titleStyle(),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return 'invalid email';
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
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => RegisterView()),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Create an account',
                          style: TextStyles.subHeadLineUnderLineStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          viewModel.validateForm();
                        },
                        text: 'Login',
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
