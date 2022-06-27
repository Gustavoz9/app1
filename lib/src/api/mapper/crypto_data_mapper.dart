import 'package:app1/src/api/viewData/cryptoData_viewData.dart';

import '../models/data_crypto_response.dart';

extension CryptoMapper on GetDataResponse {
  List<CryptoDataViewData> toViewData() {
    return data
        .map((item) => CryptoDataViewData(
              name: item.name,
              symbol: item.symbol,
              metrics: item.metrics,
            ))
        .toList();
  }
}
