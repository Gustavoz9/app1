import 'package:json_annotation/json_annotation.dart';
part '../pointG/dayValues_response.g.dart';

@JsonSerializable()
class GetValueResponse {
  final List<List<num>> btc_timeseries;

  GetValueResponse(this.btc_timeseries);
  factory GetValueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetValueResponseToJson(this);
}
