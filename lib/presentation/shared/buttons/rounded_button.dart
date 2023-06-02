import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.height = 50,
      this.primaryColor = true,
      this.width = 100,
      this.backgroundColor,
      this.leftIcon,
      this.blockDoubleClick = true,
      this.rightIcon})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final bool primaryColor;
  final bool? blockDoubleClick;
  final Color? backgroundColor;
  final AssetImage? leftIcon;
  final AssetImage? rightIcon;

  final RxBool absorbPointer = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx((() => AbsorbPointer(
          absorbing: absorbPointer.value,
          child: (ElevatedButton(
            onPressed: () {
              if (blockDoubleClick!) {
                absorbPointer.value = true;
                onBlockBoubleCLick();
              }
              onPressed.call();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, height),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (leftIcon != null)
                  ImageIcon(
                    leftIcon,
                    color: Colors.white,
                  ),
                if (leftIcon != null || rightIcon != null) const Spacer(),
                Text(
                  text,
                  style: TextStyles.subHeadLineStyle(
                      color: Colors.white, isBold: true),
                ),
                if (leftIcon != null || rightIcon != null) const Spacer(),
                if (rightIcon != null)
                  ImageIcon(
                    rightIcon,
                    color: Colors.white,
                  ),
              ],
            ),
          )),
        )));
  }

  onBlockBoubleCLick() {
    Future.delayed(const Duration(seconds: 3), () {
      absorbPointer.value = false;
    });
  }
}
