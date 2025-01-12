import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:habitchef/presentation/cubits/get_added_habits_cubit/get_added_habits_cubit.dart';
import 'package:habitchef/presentation/cubits/progress_cubit/progress_cubit.dart';
import 'package:habitchef/presentation/screens/auth/login_screen.dart';
import 'package:habitchef/presentation/screens/auth/registration_screen.dart';
import 'package:habitchef/presentation/screens/food/add_food_screen.dart';
import 'package:habitchef/presentation/screens/food/camera_screen.dart';
import 'package:habitchef/presentation/screens/food/food_dashboard_screen.dart';
import 'package:habitchef/presentation/screens/home/add_habit_screen.dart';
import 'package:habitchef/presentation/screens/home/habit_home_screen.dart';
import 'package:habitchef/presentation/screens/splash/splash_screen.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AnimatedSplashRoute.page,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HabitHomeRoute.page, initial: true),
        AutoRoute(page: NutritionDashboardRoute.page),
        AutoRoute(page: AddFoodRoute.page),
        AutoRoute(
          page: CameraRoute.page,
        ),
        AutoRoute(
          page: AddHabitRoute.page,
        ),

        /// routes go here
      ];
}
