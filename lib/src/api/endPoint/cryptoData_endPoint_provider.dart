
import 'package:dio/dio.dart';

class CryptoDataEndPointProvinder {
  final Dio _dio;
  CryptoDataEndPointProvinder(this._dio);
  Future<Response> getData() {
    return _dio.get('https://data.messari.io/api/v1/assets');
  }
}
