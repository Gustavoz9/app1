import 'package:app1/shared/api/models/responses/metrics_response_data.dart';

class DataViewData {
  final String name;
  final String symbol;
  final MetricsModel metrics;
  DataViewData(
      {required this.name, required this.symbol, required this.metrics});
}
