import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  static TextStyle titleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 22,
    );
  }

  static TextStyle subTitleStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 20,
    );
  }

  static TextStyle subTitle2Style(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 18,
    );
  }

  static TextStyle bodyStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 18,
    );
  }

  static TextStyle headlineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 16,
    );
  }

  static TextStyle subHeadLineStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.textScaleFactor * 12,
    );
  }
}
