import 'package:dartz/dartz.dart';
import 'package:habitchef/data/models/login_user_response.dart';
import 'package:habitchef/data/models/register_user_response.dart';
import 'package:habitchef/domain/entities/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> params,
  });
  Future<Either<AppError, LoginResponse>> login({
    required Map<String, dynamic> params,
  });
  Future<bool> isUserLoggedIn();
  Future<String?> getUser();
}
