import 'package:app1/shared/api/viewData/value_viewData.dart';

import '../models/responses/getAll_response.dart';
import '../models/responses/dayValues_response.dart';

extension CryptoValueMapper on GetAllResponses {
  List<ValueViewData> toViewValue() {
    return btc_timeseries
        .map((item) => ValueViewData(
              values: item.btc_timeseries,
            ))
        .toList();
  }
}
