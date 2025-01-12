// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddFoodScreen]
class AddFoodRoute extends PageRouteInfo<void> {
  const AddFoodRoute({List<PageRouteInfo>? children})
      : super(
          AddFoodRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFoodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddFoodScreen();
    },
  );
}

/// generated route for
/// [AddHabitScreen]
class AddHabitRoute extends PageRouteInfo<AddHabitRouteArgs> {
  AddHabitRoute({
    Key? key,
    required GetAddedHabitsCubit getAddedHabitsCubit,
    required HabitStatsCubit habitStatsCubit,
    List<PageRouteInfo>? children,
  }) : super(
          AddHabitRoute.name,
          args: AddHabitRouteArgs(
            key: key,
            getAddedHabitsCubit: getAddedHabitsCubit,
            habitStatsCubit: habitStatsCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'AddHabitRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddHabitRouteArgs>();
      return WrappedRoute(
          child: AddHabitScreen(
        key: args.key,
        getAddedHabitsCubit: args.getAddedHabitsCubit,
        habitStatsCubit: args.habitStatsCubit,
      ));
    },
  );
}

class AddHabitRouteArgs {
  const AddHabitRouteArgs({
    this.key,
    required this.getAddedHabitsCubit,
    required this.habitStatsCubit,
  });

  final Key? key;

  final GetAddedHabitsCubit getAddedHabitsCubit;

  final HabitStatsCubit habitStatsCubit;

  @override
  String toString() {
    return 'AddHabitRouteArgs{key: $key, getAddedHabitsCubit: $getAddedHabitsCubit, habitStatsCubit: $habitStatsCubit}';
  }
}

/// generated route for
/// [AnimatedSplashScreen]
class AnimatedSplashRoute extends PageRouteInfo<void> {
  const AnimatedSplashRoute({List<PageRouteInfo>? children})
      : super(
          AnimatedSplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimatedSplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AnimatedSplashScreen());
    },
  );
}

/// generated route for
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<void> {
  const CameraRoute({List<PageRouteInfo>? children})
      : super(
          CameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CameraScreen();
    },
  );
}

/// generated route for
/// [HabitHomeScreen]
class HabitHomeRoute extends PageRouteInfo<void> {
  const HabitHomeRoute({List<PageRouteInfo>? children})
      : super(
          HabitHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const HabitHomeScreen());
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginScreen());
    },
  );
}

/// generated route for
/// [NutritionDashboardScreen]
class NutritionDashboardRoute extends PageRouteInfo<void> {
  const NutritionDashboardRoute({List<PageRouteInfo>? children})
      : super(
          NutritionDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'NutritionDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NutritionDashboardScreen();
    },
  );
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RegistrationScreen());
    },
  );
}
