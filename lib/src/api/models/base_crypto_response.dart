import 'package:json_annotation/json_annotation.dart';

import 'metricsModel.dart';

part 'base_crypto_response.g.dart';

@JsonSerializable()
class BaseDataModel {
  String symbol;
  String name;
  MetricsModel metrics;

  BaseDataModel(
    this.name,
    this.symbol,
    this.metrics,
  );
  factory BaseDataModel.fromJson(Map<String, dynamic> json) =>
      _$BaseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDataModelToJson(this);
}
