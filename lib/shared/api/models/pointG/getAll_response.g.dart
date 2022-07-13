// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../responses/getAll_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllResponses _$GetAllResponsesFromJson(Map<String, dynamic> json) =>
    GetAllResponses(
      (json['data'] as List<dynamic>)
          .map((e) => BaseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['btc_timeseries'] as List<dynamic>)
          .map((e) => GetValueResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllResponsesToJson(GetAllResponses instance) =>
    <String, dynamic>{
      'data': instance.data,
      'btc_timeseries': instance.btc_timeseries,
    };
