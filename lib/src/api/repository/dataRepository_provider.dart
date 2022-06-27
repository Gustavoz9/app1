import 'package:app1/src/api/endPoint/end_point_provider.dart';
import 'package:app1/src/api/repository/dataRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../endPoint/end_point.dart';

final CryptoDataRepositoryProvider = Provider((ref) {
  return DataRepository(dataEndpoint: ref.read(EndPointProvider));
});
