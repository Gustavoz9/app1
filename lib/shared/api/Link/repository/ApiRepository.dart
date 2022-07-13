import 'package:app1/shared/api/models/responses/getAll_response.dart';

import '../endPoint/end_point.dart';

class Repository {
  final EndPoint dataEndpoint;

  Repository({required this.dataEndpoint});

  Future<GetAllResponses> getData() async {
    final result = await dataEndpoint.getData();
    return GetAllResponses.fromJson(result.data);
  }
}
