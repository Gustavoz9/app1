import 'package:app1/shared/api/Link/endPoint/end_point_provider.dart';
import 'package:app1/shared/api/Link/repository/ApiRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../endPoint/end_point.dart';

final RepositoryProvider = Provider((ref) {
  return Repository(dataEndpoint: ref.read(EndPointProvider));
});
