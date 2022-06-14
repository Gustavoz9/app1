import 'package:app1/src/api/models/metricsModel.dart';

class CryptoDataViewData {
  final String name;
  final String symbol;
  final MetricsModel metrics;

  CryptoDataViewData({required this.name, required this.symbol, required this.metrics});
}
