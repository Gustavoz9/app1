import 'package:app1/src/api/repository/dataRepository.dart';
import 'package:app1/src/api/viewData/cryptoData_viewData.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/data_crypto_response.dart';

extension CryptoMapper on GetDataResponse {
  List<CryptoDataViewData> toViewData() {
   
    return data.map((item) => CryptoDataViewData(
          name: item.name,
          symbol: item.symbol,
          metrics: item.metrics,
        )).toList();
  }
}
