import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../responses/service/data_service.dart';

final dataProvinder = FutureProvider.autoDispose((_) {
  final dataService = DataService.instance;
  return dataService.getData();
});
