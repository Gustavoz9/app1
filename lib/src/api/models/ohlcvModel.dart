import 'package:json_annotation/json_annotation.dart';

part 'ohlcvModel.g.dart';

@JsonSerializable()
class OhlcvModel {
  final num higth;
  final num low;

  OhlcvModel({
    required this.higth,
    required this.low,
  });

  factory OhlcvModel.fromJson(Map<String, dynamic> json) =>
      _$OhlcvModelFromJson(json);

  Map<String, dynamic> toJson() => _$OhlcvModelToJson(this);
}
