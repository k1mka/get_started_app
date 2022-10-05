import 'package:get_it/get_it.dart';
import 'package:get_started_app/presentation/data/repository/repository_impl.dart';
import 'package:get_started_app/presentation/data/services/network_service.dart';

import 'presentation/data/repository/repository.dart';
import 'presentation/data/services/network_service_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<Repository>(
    RepositoryImpl(dataService),
  );
}
