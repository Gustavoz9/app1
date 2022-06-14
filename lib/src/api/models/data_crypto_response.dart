import 'package:json_annotation/json_annotation.dart';

import '../models/base_crypto_response.dart';
import 'metricsModel.dart';

part 'data_crypto_response.g.dart';

@JsonSerializable()
class GetDataResponse {
  final List<BaseDataModel> data;
  final List<MetricsModel> metrics;

  GetDataResponse(this.data, this.metrics);

  factory GetDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataResponseToJson(this);
}
