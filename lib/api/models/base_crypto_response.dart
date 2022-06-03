import 'package:json_annotation/json_annotation.dart';

part 'base_crypto_response.g.dart';

@JsonSerializable()
class BaseDataModel {
  String symbol;
  String name;

  BaseDataModel(
    this.name,
    this.symbol,
  );
  factory BaseDataModel.fromJson(Map<String, dynamic> json) =>
      _$BaseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDataModelToJson(this);
}
