import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'app_colors.dart';

class PinputTheme {
  PinputTheme._();

  static PinTheme get defaultPinTheme => const PinTheme(
        height: 44,
        width: 64,
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      );

  static PinTheme get errorPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
        ),
      );

  static PinTheme get focusedPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
      );
}
