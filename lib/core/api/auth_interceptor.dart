import 'package:dio/dio.dart';
import 'package:habitchef/data/data_sources/local_data_source/token_local_data_source.dart';
import 'package:habitchef/di/get_it.dart';
import 'package:hive/hive.dart';

class AuthInterceptor extends QueuedInterceptor {
  late final Dio _dio;
  late final TokenLocalDataSource _tokenLocalDataSource;

  AuthInterceptor() {
    _dio = Dio();
    _tokenLocalDataSource = getIt<TokenLocalDataSource>();
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final bool requiresToken = options.headers["requiresToken"] ?? false;
    options.headers.remove("requiresToken");
    if (!requiresToken) {
      return handler.next(options);
    }
    // get tokens from local storage, you can use Hive or flutter_secure_storage
    final accessToken = await _tokenLocalDataSource.getAccessToken();
    if (accessToken == null) {
     // await _performLogout(_dio);
      return handler.reject(
        DioException(requestOptions: options, message: 'Unauthorized'),
      );
    }

    options.headers['token'] = accessToken;
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if the error is 401 or 403, then we perform logout
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      print('Unauthorized');
      _performLogout(_dio);
    }
    return handler.next(err);
  }

  Future<void> _performLogout(Dio dio) async {
    await Hive.deleteFromDisk();
    //todo
    return;
  }
}
