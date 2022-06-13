// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models/data_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      (json['data'] as List<dynamic>)
          .map((e) => BaseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'data': instance.data,
    };
