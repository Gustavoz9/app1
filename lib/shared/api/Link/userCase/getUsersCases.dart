import 'package:app1/shared/api/Link/repository/ApiRepository.dart';
import 'package:app1/shared/api/mapper/crypto_data_mapper.dart';
import 'package:app1/shared/api/mapper/dayValues_mapper.dart';
import 'package:app1/shared/api/viewData/data_viewData.dart';
import 'package:app1/shared/api/viewData/value_viewData.dart';

class getUsersCases {
  final ApiRepository dataRepository;
  getUsersCases({required this.dataRepository});

  Future<List<DataViewData>> executeData() async {
    final response = await dataRepository.getData();
    return response.toViewData();
  }

  Future<List<ValueViewData>> executeValue() async {
    final response = await dataRepository.getData();
    return response.toViewValue();
  }
}
