import 'package:app1/shared/api/viewData/data_viewData.dart';
import 'package:app1/shared/api/viewData/value_viewData.dart';

import 'getAll_viewData.dart';

class GetAllViewData {
  final DataViewData data;
  final ValueViewData btc_timeseries;

  GetAllViewData({
    required this.data,
    required this.btc_timeseries,
  });
}
