import 'package:app1/shared/api/models/responses/getAll_response.dart';

import '../endPoint/end_point.dart';

class ApiRepository {
  final EndPoint dataEndpoint;

  ApiRepository({required this.dataEndpoint});

  Future<GetAllResponses> getData() async {
    final result = await dataEndpoint.getData();
    return GetAllResponses.fromJson(result.data);
  }
}
