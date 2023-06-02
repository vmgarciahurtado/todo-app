import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/presentation/home/view_model/view_model.dart';
import 'package:todo_app/presentation/shared/buttons/rounded_button.dart';
import 'package:todo_app/presentation/shared/inputs/custom_input.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class DialogCreateTask extends StatelessWidget {
  const DialogCreateTask({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 120),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Colores.grayBackground,
            borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colores.grayBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'New Task',
                style: TextStyles.titleStyle(),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: viewModel.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter the title';
                          }
                          if (value.length < 2) {
                            return 'Invalid title';
                          }
                          return null;
                        },
                        onChanged: (value) => viewModel.title = value,
                        style: const TextStyle(color: Colors.grey),
                        decoration: CustomInput.roundedInputDecoration(
                            hint: 'Enter the title',
                            label: 'Title',
                            icon: CupertinoIcons.textbox),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter the description';
                          }
                          if (value.length < 2) {
                            return 'Invalid description';
                          }
                          return null;
                        },
                        onChanged: (value) => viewModel.description = value,
                        style: const TextStyle(color: Colors.grey),
                        decoration: CustomInput.roundedInputDecoration(
                            hint: 'Enter the description',
                            label: 'Description',
                            icon: CupertinoIcons.text_bubble),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        viewModel.validateForm();
                      },
                      text: 'Create',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
