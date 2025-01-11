import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Color;

class AppColors {
  AppColors._();

  //#07CFAB
  static const Color primaryColor = Color(0xFF07CFAB);
  static const Color secondaryColor = Color(0xFF008080);

  //#F4F4F4
  static const Color scaffoldBackgroundColor = Color(0xFFF4F4F4);

  static const List<Color> gradientColors = [
    Color(0xFF1EFFD7),
    Color(0xFF008080),
  ];

  static List<Color> gradientColorsWithOpacity(double opacity) {
    return [
      const Color(0xFF1EFFD7).withOpacity(opacity),
      const Color(0xFF008080).withOpacity(opacity),
    ];
  }

  static const Color orange = Color(0xFFFF703B);

  static const Color greenishBlue = Color(0xFF008080);

  static const Color lightSeaGreen = Color(0xFF25D3D3);

  static const Color green = Color(0xFF9AD960);

  //Border-Color 0xFFF7F8F8
  static const Color borderColor = Color(0xFFF7F8F8);

  // Gray 1 #7B6F72
  static const Color gray1 = Color(0xFF7B6F72);

  // Gray 2 #ADA4A5
  static const Color gray2 = Color(0xFFADA4A5);

  // Gray 3 Color(0xFFACA3A5)
  static const Color gray3 = Color(0xFFACA3A5);
}
