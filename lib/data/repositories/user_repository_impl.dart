import 'package:dartz/dartz.dart';
import 'package:habitchef/core/api/api_call_with_error.dart';
import 'package:habitchef/data/data_sources/local_data_source/token_local_data_source.dart';
import 'package:habitchef/data/data_sources/local_data_source/user_local_data_source.dart';
import 'package:habitchef/data/data_sources/remote_data_source/user_remote_data_source.dart';
import 'package:habitchef/data/models/login_user_response.dart';
import 'package:habitchef/data/models/register_user_response.dart';
import 'package:habitchef/domain/entities/app_error.dart';
import 'package:habitchef/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;
  UserRepositoryImpl(this._userRemoteDataSource, this._tokenLocalDataSource,
      this._userLocalDataSource);

  @override
  Future<Either<AppError, LoginResponse>> login(
      {required Map<String, dynamic> params}) {
    return ApiCallWithError.call(() async {
      print('calling gere');
      var res = await _userRemoteDataSource.login(params: params);
      print(res);

      await Future.wait(
        [
          _tokenLocalDataSource.cacheAccessToken(res.token),
          _userLocalDataSource.cacheUserName(userName: res.user.username),
          _userLocalDataSource.stroeUserLoggedStatus(),
        ],
      );
      return res;
    });
  }

  @override
  Future<Either<AppError, RegisterUserResponse>> registerUser(
      {required Map<String, dynamic> params}) {
    return ApiCallWithError.call(() async {
      print("${params.entries}");
      var res = await _userRemoteDataSource.registerUser(params: params);
      print("repose res$res");
      await Future.wait(
        [
          _tokenLocalDataSource.cacheAccessToken(res.token),
          _userLocalDataSource.cacheUserName(userName: res.user.username),
          _userLocalDataSource.stroeUserLoggedStatus(),
        ],
      );
      return res;
    });
  }

  @override
  Future<bool> isUserLoggedIn() async {
    var res = await _userLocalDataSource.isUserLoggedIn();
    print(res);
    return res;
  }

  @override
  Future<String?> getUser() async {
    var res = await _userLocalDataSource.getUser();
    print(res);
    return res;
  }

  @override
  Future<bool> logout() async {
    var res = await _userLocalDataSource.logOut();
    return res;
  }
}
