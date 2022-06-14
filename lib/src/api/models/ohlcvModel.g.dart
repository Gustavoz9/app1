// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlcvModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OhlcvModel _$OhlcvModelFromJson(Map<String, dynamic> json) => OhlcvModel(
      open: (json['open'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
    );

Map<String, dynamic> _$OhlcvModelToJson(OhlcvModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
