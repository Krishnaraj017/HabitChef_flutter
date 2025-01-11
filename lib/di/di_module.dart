import 'package:dio/dio.dart';
import 'package:habitchef/utils/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          contentType: Headers.jsonContentType,
          baseUrl: ApiConstants.basePath,
          connectTimeout: const Duration(milliseconds: 60 * 1000),
          receiveTimeout: const Duration(milliseconds: 60 * 1000),
          sendTimeout: const Duration(milliseconds: 30 * 1000),
        ),
      );  
}
