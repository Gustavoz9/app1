import '../endPoint/end_point.dart';
import '../models/data_crypto_response.dart';

class DataRepository {
  final EndPoint dataEndpoint;

  DataRepository({required this.dataEndpoint});

  Future<GetDataResponse> getData() async {
    final result = await dataEndpoint.getData();
    return GetDataResponse.fromJson(result.data);
  }
}
