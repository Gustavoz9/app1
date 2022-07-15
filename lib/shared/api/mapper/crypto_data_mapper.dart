import 'package:app1/shared/api/viewData/data_viewData.dart';

import '../models/responses/getAll_response.dart';

extension DataMapper on GetAllResponses {
  List<DataViewData> toViewData() {
    return data
        .map((item) => DataViewData(
              name: item.name,
              symbol: item.symbol,
              metrics: item.metrics,
            ))
        .toList();
  }
}
