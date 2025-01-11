import 'package:flutter/material.dart';
import 'package:habitchef/presentation/theme/app_colors.dart';

extension TextThemeExtension on TextTheme {
  // TextStyle get h1 => GoogleFonts.poppins(fontSize: 26);

  // TextStyle get h2 => GoogleFonts.poppins(fontSize: 24);

  // TextStyle get h3 => GoogleFonts.poppins(fontSize: 20);

  // TextStyle get large => GoogleFonts.poppins(fontSize: 32);

  // TextStyle get title => GoogleFonts.poppins(fontSize: 18);

  // TextStyle get h4 => GoogleFonts.poppins(fontSize: 16);

  // TextStyle get regularSmall => GoogleFonts.poppins(fontSize: Sizes.size16);

  TextStyle get h1 => TextStyle(fontFamily: 'HeadLand', fontSize: Sizes.size24);

  TextStyle get h2 => TextStyle(fontFamily: 'HeadLand', fontSize: Sizes.size22);

  TextStyle get h3Pop =>
      TextStyle(fontFamily: 'Poppins', fontSize: Sizes.size20);
  TextStyle get h3Head =>
      TextStyle(fontFamily: 'HeadLand', fontSize: Sizes.size20);

  TextStyle get h4Pop =>
      TextStyle(fontFamily: 'Poppins', fontSize: Sizes.size16);
  TextStyle get h4Head =>
      TextStyle(fontFamily: 'HeadLand', fontSize: Sizes.size16);

  TextStyle get h5 => TextStyle(fontFamily: 'Poppins', fontSize: Sizes.size14);

  TextStyle get h6 => TextStyle(fontFamily: 'Poppins', fontSize: Sizes.size12);

  TextStyle get h1Medium => h1.copyWith(fontWeight: FontWeight.w500);

  TextStyle get h3PopMedium => h3Pop.copyWith(fontWeight: FontWeight.w500);

  TextStyle get h4PopMedium => h4Pop.copyWith(fontWeight: FontWeight.w500);

  TextStyle get h4PopSemiBolt => h4Pop.copyWith(fontWeight: FontWeight.w600);
  TextStyle get h5PopMedium => h5.copyWith(fontWeight: FontWeight.bold);
  TextStyle get h5PopSmall => h5.copyWith(fontWeight: FontWeight.w300);
  TextStyle get h6Semibold => h6.copyWith(fontWeight: FontWeight.w600);

  TextStyle get h6Medium => h6.copyWith(fontWeight: FontWeight.w500);
}

extension ThemeExtension on ThemeData {
  BoxDecoration get rosetteCardDecoration => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x19040404),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      );

  BoxDecoration get rosetteCardDecorationTwo => const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(colors: AppColors.gradientColors),
        boxShadow: [
          BoxShadow(
            color: Color(0x19040404),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      );
}

class Sizes {
  static late double size10;
  static late double size12;
  static late double size14;
  static late double size16;
  static late double size18;
  static late double size20;
  static late double size26;
  static late double size34;
  static late double size36;
  static late double size42;
  static late double size50;
  static late double size24;
  static late double size30;
  static late double size52;
  static late double size32;
  static late double size22;

  void init(Size size) {
    size52 = size.height <= 640
        ? 47
        : size.height > 640.0 && size.height <= 740
            ? 49
            : size.height > 740.0 && size.height <= 820
                ? 52
                : size.height > 820.0 && size.height <= 900
                    ? 53
                    : size.height > 900.0 && size.height <= 1040
                        ? 54
                        : 56;
    size50 = size.height <= 640
        ? 39
        : size.height > 640.0 && size.height <= 740
            ? 48
            : size.height > 740.0 && size.height <= 820
                ? 50
                : size.height > 820.0 && size.height <= 900
                    ? 51
                    : size.height > 900.0 && size.height <= 1040
                        ? 52
                        : 56;
    size30 = size.height <= 640
        ? 25
        : size.height > 640.0 && size.height <= 740
            ? 28
            : size.height > 740.0 && size.height <= 820
                ? 30
                : size.height > 820.0 && size.height <= 900
                    ? 31
                    : size.height > 900.0 && size.height <= 1040
                        ? 32
                        : 32;
    size10 = size.height <= 640
        ? 7
        : size.height > 640.0 && size.height <= 740
            ? 8
            : size.height > 740.0 && size.height <= 820
                ? 10
                : size.height > 820.0 && size.height <= 900
                    ? 11
                    : size.height > 900.0 && size.height <= 1040
                        ? 12
                        : 14;
    size12 = size.height <= 640
        ? 9
        : size.height > 640.0 && size.height <= 740
            ? 11
            : size.height > 740.0 && size.height <= 820
                ? 13
                : size.height > 820.0 && size.height <= 900
                    ? 14
                    : size.height > 900.0 && size.height <= 1040
                        ? 15
                        : 16;
    size14 = size.height <= 640
        ? 12
        : size.height > 640.0 && size.height <= 740
            ? 13
            : size.height > 740.0 && size.height <= 820
                ? 14
                : size.height > 820.0 && size.height <= 900
                    ? 15
                    : size.height > 900.0 && size.height <= 1040
                        ? 16
                        : 17;
    size16 = size.height <= 640
        ? 14
        : size.height > 640.0 && size.height <= 740
            ? 15
            : size.height > 740.0 && size.height <= 820
                ? 16
                : size.height > 820.0 && size.height <= 900
                    ? 17
                    : size.height > 900.0 && size.height <= 1040
                        ? 18
                        : 20;
    size18 = size.height <= 640
        ? 15
        : size.height > 640.0 && size.height <= 740
            ? 16
            : size.height > 740.0 && size.height <= 820
                ? 18
                : size.height > 820.0 && size.height <= 900
                    ? 19
                    : size.height > 900.0 && size.height <= 1040
                        ? 20
                        : 21;
    size20 = size.height <= 640
        ? 16
        : size.height > 640.0 && size.height <= 740
            ? 18
            : size.height > 740.0 && size.height <= 820
                ? 20
                : size.height > 820.0 && size.height <= 900
                    ? 21
                    : size.height > 900.0 && size.height <= 1040
                        ? 22
                        : 22;
    size26 = size.height <= 640
        ? 22
        : size.height > 640.0 && size.height <= 740
            ? 24
            : size.height > 740.0 && size.height <= 820
                ? 26
                : size.height > 820.0 && size.height <= 900
                    ? 27
                    : size.height > 900.0 && size.height <= 1040
                        ? 28
                        : 29;
    size34 = size.height <= 640
        ? 28
        : size.height > 640.0 && size.height <= 740
            ? 30
            : size.height > 740.0 && size.height <= 820
                ? 32
                : size.height > 820.0 && size.height <= 900
                    ? 33
                    : size.height > 900.0 && size.height <= 1040
                        ? 34
                        : 36;
    size36 = size.height <= 640
        ? 30
        : size.height > 640.0 && size.height <= 740
            ? 32
            : size.height > 740.0 && size.height <= 820
                ? 34
                : size.height > 820.0 && size.height <= 900
                    ? 35
                    : size.height > 900.0 && size.height <= 1040
                        ? 36
                        : 38;
    size42 = size.height <= 640
        ? 36
        : size.height > 640.0 && size.height <= 740
            ? 38
            : size.height > 740.0 && size.height <= 820
                ? 40
                : size.height > 820.0 && size.height <= 900
                    ? 42
                    : size.height > 900.0 && size.height <= 1040
                        ? 44
                        : 46;
    size24 = size.height <= 640
        ? 18
        : size.height > 640.0 && size.height <= 740
            ? 20
            : size.height > 740.0 && size.height <= 820
                ? 22
                : size.height > 820.0 && size.height <= 900
                    ? 23
                    : size.height > 900.0 && size.height <= 1040
                        ? 24
                        : 26;
    size32 = size.height <= 640
        ? 26
        : size.height > 640.0 && size.height <= 740
            ? 28
            : size.height > 740.0 && size.height <= 820
                ? 30
                : size.height > 820.0 && size.height <= 900
                    ? 32
                    : size.height > 900.0 && size.height <= 1040
                        ? 33
                        : 36;
    size22 = size.height <= 640
        ? 16
        : size.height > 640.0 && size.height <= 740
            ? 18
            : size.height > 740.0 && size.height <= 820
                ? 20
                : size.height > 820.0 && size.height <= 900
                    ? 21
                    : size.height > 900.0 && size.height <= 1040
                        ? 22
                        : 26;
  }
}


// h1 24 -> 400 (headland)

// h2 22 -> 400 (headland)

// h3 20 -> 400 () poppins

// h4 16 -> 400 () poppins

// h5 14 -> 400 () poppins

//h6 12 -> 400 () poppins