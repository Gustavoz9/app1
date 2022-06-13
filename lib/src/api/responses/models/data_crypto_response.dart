import 'package:json_annotation/json_annotation.dart';

import '../models/base_crypto_response.dart';

part '../data_crypto_response.g.dart';

@JsonSerializable()
class DataModel {
  final List<BaseDataModel> data;

  DataModel(this.data);

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
