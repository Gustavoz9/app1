import 'package:json_annotation/json_annotation.dart';

import 'marketDataModel.dart';

part 'metricsModel.g.dart';

@JsonSerializable()
class MetricsModel {
  final MarketDataModel marketData;

  MetricsModel({required this.marketData});
  factory MetricsModel.fromJson(Map<String, dynamic> json) =>
      _$MetricsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsModelToJson(this);
}
