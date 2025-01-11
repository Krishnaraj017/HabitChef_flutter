// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_client.dart' as _i424;
import '../data/data_sources/local_data_source/token_local_data_source.dart'
    as _i666;
import '../data/data_sources/local_data_source/user_local_data_source.dart'
    as _i991;
import '../data/data_sources/remote_data_source/user_remote_data_source.dart'
    as _i642;
import '../data/repositories/user_repository_impl.dart' as _i223;
import '../domain/repositories/user_repository.dart' as _i544;
import '../presentation/cubits/add_habit_cubit/add_habit_cubit.dart' as _i1039;
import '../presentation/cubits/auth_cubit/registration_cubit.dart' as _i82;
import '../presentation/cubits/get_added_habits_cubit/get_added_habits_cubit.dart'
    as _i609;
import '../presentation/cubits/home/home_cubit.dart' as _i973;
import '../presentation/routes/app_router.dart' as _i591;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i1039.AddHabitCubit>(() => _i1039.AddHabitCubit());
    gh.factory<_i609.GetAddedHabitsCubit>(() => _i609.GetAddedHabitsCubit());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i591.AppRouter>(() => _i591.AppRouter());
    gh.lazySingleton<_i991.UserLocalDataSource>(
        () => _i991.UserLocalDataSourceImpl());
    gh.lazySingleton<_i666.TokenLocalDataSource>(
        () => _i666.TokenLocalDataSourceImpl());
    gh.lazySingleton<_i424.ApiClient>(() => _i424.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i642.UserRemoteDataSource>(
        () => _i642.UserRemoteDataSourceImpl(gh<_i424.ApiClient>()));
    gh.lazySingleton<_i544.UserRepository>(() => _i223.UserRepositoryImpl(
          gh<_i642.UserRemoteDataSource>(),
          gh<_i666.TokenLocalDataSource>(),
          gh<_i991.UserLocalDataSource>(),
        ));
    gh.factory<_i82.RegistrationCubit>(
        () => _i82.RegistrationCubit(gh<_i544.UserRepository>()));
    gh.factory<_i973.HomeCubit>(
        () => _i973.HomeCubit(gh<_i544.UserRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i211.InjectableModule {}
