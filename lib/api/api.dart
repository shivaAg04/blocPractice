import 'package:dio/dio.dart';

class API {
  Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://singhneelesh.github.io/assignment";
  }

  Dio get sendRequest => _dio;
}
