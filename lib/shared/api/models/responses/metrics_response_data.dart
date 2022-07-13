import 'package:json_annotation/json_annotation.dart';

import 'marketData_response_data.dart';

part '../pointG/metrics_response_data.g.dart';

@JsonSerializable()
class MetricsModel {
  final MarketDataModel market_data;

  MetricsModel({required this.market_data});
  factory MetricsModel.fromJson(Map<String, dynamic> json) =>
      _$MetricsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsModelToJson(this);
}
