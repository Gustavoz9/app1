import 'package:app1/src/api/mapper/cryptoData_mapper.dart';
import 'package:app1/src/api/repository/dataRepository.dart';

import '../viewData/cryptoData_viewData.dart';

class getCryptoDataUserCase {
  final DataRepository dataRepository;
  getCryptoDataUserCase({required this.dataRepository});

  Future<List<CryptoDataViewData>> execute() async {
    final response = await dataRepository.getData();
    return response.toViewData();
  }
}
