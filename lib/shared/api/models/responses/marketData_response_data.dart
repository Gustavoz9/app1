import 'package:json_annotation/json_annotation.dart';

import 'ohlcv_response_data.dart';

part '../pointG/marketData_response_data.g.dart';

@JsonSerializable()
class MarketDataModel {
  final num price_usd;
  final num percent_change_usd_last_1_hour;
  final OhlcvModel ohlcv_last_1_hour;

  MarketDataModel(
      {required this.price_usd,
      required this.percent_change_usd_last_1_hour,
      required this.ohlcv_last_1_hour});

  factory MarketDataModel.fromJson(Map<String, dynamic> json) =>
      _$MarketDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataModelToJson(this);
}
