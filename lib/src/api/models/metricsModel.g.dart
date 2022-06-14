// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metricsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsModel _$MetricsModelFromJson(Map<String, dynamic> json) => MetricsModel(
      marketData:
          MarketDataModel.fromJson(json['marketData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetricsModelToJson(MetricsModel instance) =>
    <String, dynamic>{
      'marketData': instance.marketData,
    };
