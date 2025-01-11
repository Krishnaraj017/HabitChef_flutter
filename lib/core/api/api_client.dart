import 'package:dio/dio.dart';
import 'package:habitchef/core/api/auth_interceptor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
  }

  dynamic post({
    required String path,
    Map<String, dynamic>? params,
    bool requiresToken = true,
  }) async {
    print("calling posst++++++1");
    print("path++++++1${path}");
    print("params++++++1${params}");
    print("requiresToken++++++1${requiresToken}");

    var response = await _dio.post(
      path,
      data: params,
      options: Options(
        headers: {'requiresToken': requiresToken},
      ),
    );
    print("response++++++2${response}");
    return response.data;
  }

  dynamic get({
    required String path,
    Map<String, dynamic>? params,
    bool requiresToken = true,
    String? baseUrl,
    ResponseType responseType = ResponseType.json,
  }) async {
    var response = await _dio.get(
      baseUrl == null ? path : baseUrl + path,
      queryParameters: params,
      options: Options(
        headers: {
          'requiresToken': requiresToken,
        },
        responseType: responseType,
      ),
    );
    return response.data;
  }

  dynamic fileUpload({
    required String path,
    required FormData formData,
    bool requiresToken = true,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    var response = await _dio.post(
      path,
      data: formData,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      options: Options(
        headers: {'requiresToken': requiresToken},
      ),
    );
    return response.data;
  }
}
