import 'package:app1/api/responses/data_crypto_response.dart';
import 'package:dio/dio.dart';

class DataService {
  DataService._();
  static final instance = DataService._();

  final url = 'https://data.messari.io/api/';

  Future<DataModel> getData() async {
    final response = await Dio().get(url);
    return DataModel.fromJson(response.data);
  }
}
