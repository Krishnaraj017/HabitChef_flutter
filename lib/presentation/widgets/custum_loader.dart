import 'package:flutter/material.dart';
import 'package:habitchef/presentation/theme/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitCubeGrid(
      color: AppColors.primaryColor,
    );
  }
}
