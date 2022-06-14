// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataResponse _$GetDataResponseFromJson(Map<String, dynamic> json) =>
    GetDataResponse(
      (json['data'] as List<dynamic>)
          .map((e) => BaseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['metrics'] as List<MetricsModel>,
    );

Map<String, dynamic> _$GetDataResponseToJson(GetDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'metrics': instance.metrics,
    };
