import 'package:json_annotation/json_annotation.dart';

import '../models/base_crypto_response.dart';
import 'metricsModel.dart';

part 'data_crypto_response.g.dart';

@JsonSerializable()
class GetDataResponse {
  final List<BaseDataModel> data;

  GetDataResponse(this.data);

  factory GetDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataResponseToJson(this);
}
