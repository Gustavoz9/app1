import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cryptoData_endPoint_provider.dart';

final dataProvider = Provider(((ref) {
  final _dio = Dio(BaseOptions(baseUrl: 'https://data.messari.io/api/v1/assets'));
  return CryptoDataEndPointProvinder(_dio);
}));
