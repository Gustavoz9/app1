import 'package:app1/src/api/endPoint/endPoint_provider.dart';
import 'package:app1/src/api/repository/dataRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../endPoint/cryptoData_endPoint_provider.dart';

final CryptoDataRepositoryProvider = Provider((ref) {
  return DataRepository(dataEndpoint: ref.read(dataProvider));
});
