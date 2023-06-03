import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/home/view_model/view_model.dart';
import 'package:todo_app/presentation/shared/buttons/rounded_button.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class DialogCloseSession extends StatelessWidget {
  const DialogCloseSession({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 220),
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
                'Do you want to close the session?',
                style: TextStyles.subTitle2Style(),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        viewModel.closeSession();
                      },
                      text: 'Yes',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'No',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
