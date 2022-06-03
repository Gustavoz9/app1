// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDataModel _$BaseDataModelFromJson(Map<String, dynamic> json) =>
    BaseDataModel(
      json['name'] as String,
      json['symbol'] as String,
    );

Map<String, dynamic> _$BaseDataModelToJson(BaseDataModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
    };
