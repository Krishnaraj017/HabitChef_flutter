import 'package:habitchef/di/get_it.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true,
)
void configureDependencies() => getIt.init();
