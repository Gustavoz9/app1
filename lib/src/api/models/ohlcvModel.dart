import 'package:json_annotation/json_annotation.dart';

part 'ohlcvModel.g.dart';

@JsonSerializable()
class OhlcvModel {
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;

  OhlcvModel(
      {required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  factory OhlcvModel.fromJson(Map<String, dynamic> json) =>
      _$OhlcvModelFromJson(json);

  Map<String, dynamic> toJson() => _$OhlcvModelToJson(this);
}
