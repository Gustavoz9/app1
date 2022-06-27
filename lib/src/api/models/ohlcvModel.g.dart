// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlcvModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OhlcvModel _$OhlcvModelFromJson(Map<String, dynamic> json) => OhlcvModel(
      open: json['open'] as num,
      high: json['high'] as num,
      low: json['low'] as num,
      close: json['close'] as num,
      volume: json['volume'] as num,
    );

Map<String, dynamic> _$OhlcvModelToJson(OhlcvModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
