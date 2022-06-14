
import 'package:app1/src/api/endPoint/endPoint_provider.dart';


import 'package:app1/src/api/userCase/crypto_userCase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/base_crypto_response.dart';
import '../repository/dataRepository_provider.dart';
import '../viewData/cryptoData_viewData.dart';

final getScreenUseCase = Provider((ref) {
  return getCryptoDataUserCase(
      dataRepository: ref.read(CryptoDataRepositoryProvider)
      );
});

final getScreenProvider = FutureProvider<List<CryptoDataViewData>>((ref) async {
  return ref
      .read(getScreenUseCase)
      .execute();
});