import 'package:dio/dio.dart';

class ApiProvider {
  Dio? _dio;

  static BaseOptions options = BaseOptions(
    connectTimeout: 60000,
    headers: {
      "Content-Type": "application/json",
    },
  );

  ApiProvider._internal() {
    _dio = Dio(options);
  }

  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }
  Dio get httpClient => _dio!;

  Future<Response> get(path) async => _dio!.get(path);
}
