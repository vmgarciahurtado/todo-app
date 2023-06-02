import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo_app/presentation/shared/cards/custom_card.dart';
import 'package:todo_app/presentation/shared/styles/text_styles.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class CustomLoading {
  final String title;
  final String? iconImage;
  final bool? barrierDismissible;
  final IconData? icon;

  CustomLoading(
      {required this.title,
      this.iconImage,
      this.icon,
      this.barrierDismissible}) {
    showLoadingDialog();
  }

  showLoadingDialog() {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(Get.width * 0.7, 190)),
              child: CustomCard(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 20),
                      child: SpinKitCircle(
                        color: Colores.primaryColor,
                        size: 50.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      // padding: const EdgeInsets.only(bottom: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyles.bodyStyle(
                            isBold: true, color: Colores.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible:
            barrierDismissible != null ? barrierDismissible! : false);
  }
}
