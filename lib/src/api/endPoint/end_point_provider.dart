import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'end_point.dart';

final EndPointProvider = Provider(((ref) {
  final _dio = Dio(BaseOptions(baseUrl: 'https://data.messari.io/api'));
  return EndPoint(_dio);
}));
