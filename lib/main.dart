import 'package:flutter/material.dart';
import 'package:habitchef/di/get_it.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  

  runApp(const MyApp());
}
