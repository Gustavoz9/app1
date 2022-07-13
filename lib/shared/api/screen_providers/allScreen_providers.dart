import 'package:app1/shared/api/Link/repository/ApiRepository_provider.dart';
import 'package:app1/shared/api/Link/userCase/getUsersCases.dart';
import 'package:app1/shared/api/viewData/data_viewData.dart';
import 'package:app1/shared/api/viewData/value_viewData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/responses/data_response.dart';
import '../viewData/getAll_viewData.dart';

final getScreenUseCase = Provider((ref) {
  return getUsersCases(dataRepository: ref.read(RepositoryProvider));
});

final getScreenDataProvider = FutureProvider<List<DataViewData>>((ref) async {
  return ref.read(getScreenUseCase).executeData();
});
final getScreenDayValueProvider =
    FutureProvider<List<ValueViewData>>((ref) async {
  return ref.read(getScreenUseCase).executeValue();
});
