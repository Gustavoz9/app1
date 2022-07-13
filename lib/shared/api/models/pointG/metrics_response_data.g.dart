// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../responses/metrics_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsModel _$MetricsModelFromJson(Map<String, dynamic> json) => MetricsModel(
      market_data:
          MarketDataModel.fromJson(json['market_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetricsModelToJson(MetricsModel instance) =>
    <String, dynamic>{
      'market_data': instance.market_data,
    };
