// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../responses/dayValues_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetValueResponse _$GetValueResponseFromJson(Map<String, dynamic> json) =>
    GetValueResponse(
      (json['btc_timeseries'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$GetValueResponseToJson(GetValueResponse instance) =>
    <String, dynamic>{
      'btc_timeseries': instance.btc_timeseries,
    };
