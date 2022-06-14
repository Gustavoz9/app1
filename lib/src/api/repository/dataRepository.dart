import '../endPoint/cryptoData_endPoint_provider.dart';
import '../models/data_crypto_response.dart';

class DataRepository {
  final CryptoDataEndPointProvinder dataEndpoint;

  DataRepository({required this.dataEndpoint});

  Future<GetDataResponse> getData() async {
    final result = await dataEndpoint.getData();
    return GetDataResponse.fromJson(result.data);
  }
}
