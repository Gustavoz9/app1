import 'package:dio/dio.dart';

class EndPoint {
  final Dio _dio;
  EndPoint(this._dio);
  Future<Response> getData() {
    return _dio.get('/db');
  }
}
