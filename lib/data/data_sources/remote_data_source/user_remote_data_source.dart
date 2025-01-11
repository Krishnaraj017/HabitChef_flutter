import 'package:habitchef/core/api/api_client.dart';
import 'package:habitchef/data/models/login_user_response.dart';
import 'package:habitchef/data/models/register_user_response.dart';
import 'package:habitchef/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<RegisterUserResponse> registerUser(
      {required Map<String, dynamic> params});
  Future<LoginResponse> login({required Map<String, dynamic> params});
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient _apiClient;

  UserRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login({required Map<String, dynamic> params}) async {
    print("calling here tpp");
    final response =
        await _apiClient.post(path: ApiConstants.login, params: params);
    print(response);
    return LoginResponse.fromJson(response);
  }

  @override
  Future<RegisterUserResponse> registerUser(
      {required Map<String, dynamic> params}) async {
    print("params$params");
    final response = await _apiClient.post(
        path: ApiConstants.register, params: params, requiresToken: false);
    print("response+++=$response");
    return RegisterUserResponse.fromJson(response);
  }
}
