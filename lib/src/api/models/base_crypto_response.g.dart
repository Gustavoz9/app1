// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDataModel _$BaseDataModelFromJson(Map<String, dynamic> json) =>
    BaseDataModel(
      json['name'] as String,
      json['symbol'] as String,
      MetricsModel.fromJson(json['metrics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseDataModelToJson(BaseDataModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'metrics': instance.metrics,
    };
