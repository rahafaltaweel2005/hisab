import 'package:dio/dio.dart';
import '../constant/api_const.dart';
import '../constant/app_const.dart';
import '../storage/secure_storage_helper.dart';
import 'api_exceptions.dart';

class ApiClient {
  ApiClient._();

  static late final Dio _dio;

  static void Function()? onUnauthorized;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await SecureStorageHelper.read(
            key: AppConst.accessTokenKey,
          );
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // ما في Refresh Token بهاد الباك إند.
            // التوكن انتهت صلاحيتها أو غير صالحة → امسحها محليًا
            // ووجّه المستخدم لتسجيل الدخول.
            await SecureStorageHelper.delete(key: AppConst.accessTokenKey);
            await SecureStorageHelper.delete(key: AppConst.tokenExpiryKey);
            onUnauthorized?.call();
          }
          return handler.next(error);
        },
      ),
    );

    assert(() {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
      return true;
    }());
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }

  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (error) {
      throw ApiExceptions.handle(error);
    }
  }
}
