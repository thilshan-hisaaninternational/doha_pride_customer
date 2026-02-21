import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  // sl.registerLazySingleton(() => Dio()); // later when backend ready

  // Features — register as you build them
  // _initAuth();
  // _initTransfers();
  // _initHome();
}

// void _initTransfers() {
//   sl.registerFactory(() => TransferBloc(getTransfers: sl()));
//   sl.registerLazySingleton(() => GetTransfers(sl()));
//   sl.registerLazySingleton<TransferRepository>(
//     () => TransferRepositoryImpl(dataSource: sl()),
//   );
//   sl.registerLazySingleton<TransferDataSource>(
//     () => TransferMockDataSource(),
//   );
// }