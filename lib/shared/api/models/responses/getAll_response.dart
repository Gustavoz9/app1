import 'package:app1/shared/api/models/responses/dayValues_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_response.dart';
import 'metrics_response_data.dart';

part '../pointG/getAll_response.g.dart';

@JsonSerializable()
class GetAllResponses {
  final List<BaseDataModel> data;
  final List<GetValueResponse> btc_timeseries;
  GetAllResponses(this.data, this.btc_timeseries);

  factory GetAllResponses.fromJson(Map<String, dynamic> json) =>
      _$GetAllResponsesFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllResponsesToJson(this);
}
