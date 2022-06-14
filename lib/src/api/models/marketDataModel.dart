import 'package:json_annotation/json_annotation.dart';

import 'ohlcvModel.dart';

part 'marketDataModel.g.dart';

@JsonSerializable()
class MarketDataModel {
  final double price_usd;
  final double percent_change_usd_last_1_hour;
  final OhlcvModel ohlcv;

  MarketDataModel(
      {required this.price_usd,
      required this.percent_change_usd_last_1_hour,
      required this.ohlcv});

  factory MarketDataModel.fromJson(Map<String, dynamic> json) =>
      _$MarketDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataModelToJson(this);
}
