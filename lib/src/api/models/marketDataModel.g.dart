// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDataModel _$MarketDataModelFromJson(Map<String, dynamic> json) =>
    MarketDataModel(
      price_usd: json['price_usd'] as num,
      percent_change_usd_last_1_hour:
          json['percent_change_usd_last_1_hour'] as num,
      ohlcv_last_1_hour: OhlcvModel.fromJson(
          json['ohlcv_last_1_hour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketDataModelToJson(MarketDataModel instance) =>
    <String, dynamic>{
      'price_usd': instance.price_usd,
      'percent_change_usd_last_1_hour': instance.percent_change_usd_last_1_hour,
      'ohlcv_last_1_hour': instance.ohlcv_last_1_hour,
    };
