import 'package:flutter/material.dart';
import 'package:todo_app/presentation/shared/theme/colores.dart';

class PrimaryTheme {
  static final theme = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme(
          primary: Colores.primaryColor,
          background: Colors.red,
          onPrimary: Colores.primaryGray,
          secondary: Colores.secondaryColor,
          surface: Colors.red,
          error: Colors.red,
          onSecondary: Colors.white,
          brightness: Brightness.light,
          onError: Colors.red,
          onSurface: Colores.primaryGray,
          onBackground: Colors.red),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
      ),
      scaffoldBackgroundColor: Colors.grey.shade100,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colores.secondaryColor));
}
