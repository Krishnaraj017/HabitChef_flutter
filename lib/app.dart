import 'package:flutter/material.dart';
import 'package:habitchef/presentation/routes/app_router.dart';
import 'package:habitchef/presentation/theme/app_theme.dart';
import 'package:habitchef/presentation/theme/theme_extensions.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    Sizes().init(MediaQuery.of(context).size);

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'My App', // Replace with a static title
      theme: AppTheme.lightTheme(context),
    );
  }
}
