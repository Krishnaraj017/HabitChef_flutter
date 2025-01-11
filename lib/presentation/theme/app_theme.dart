import 'package:flutter/material.dart';
import 'package:habitchef/presentation/theme/app_colors.dart';
import 'package:habitchef/presentation/theme/theme_extensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 32.0,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Colors.black,
          ),
          // Define other text styles as needed
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.borderColor,
          iconColor: AppColors.gray1,
          hintStyle: const TextStyle(
            color: AppColors.gray2,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          //Primary -Teal blue

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            textStyle:
                Theme.of(context).textTheme.h3Pop.apply(color: Colors.white),
          ),
        ),
      );
}
