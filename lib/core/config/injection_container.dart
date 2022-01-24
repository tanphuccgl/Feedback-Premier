// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:review_premier_pearl/core/network/network_info.dart';
import 'package:review_premier_pearl/feature/review_offline/data/data_sources/review_offline_data_source.dart';
import 'package:review_premier_pearl/feature/review_offline/data/repositories/review_offline_repository_impl.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/repositories/review_offline_repository.dart';
import 'package:review_premier_pearl/feature/review_offline/domain/usecases/post_review_offline.dart';
import 'package:review_premier_pearl/feature/review_offline/presentation/managers/post_review_offline_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  // sl.registerFactory(
  //   () => LoginBloc(
  //     lg: sl(),
  //     cu: sl(),
  //   ),
  // );
  // sl.registerFactory(
  //   () => PostForgotPwBloc(postForgotPw: sl()),
  // );
  // sl.registerFactory(
  //   () => PostTokenPwBloc(postTokenPw: sl()),
  // );
  // sl.registerFactory(
  //   () => PutNewPwBloc(putNewPw: sl()),
  // );
  // sl.registerFactory(() => RoomDetailBloc(lg: sl()));
  sl.registerFactory(() => PostReviewOfflineBloc(postReviewOffline: sl()));

  ///use case
  sl.registerLazySingleton(() => PostReviewOffline(repository: sl()));
  // sl.registerLazySingleton(() => GetCurrentUser(loginRepository: sl()));
  // sl.registerLazySingleton(() => PostForgotPw(forgotPwRepository: sl()));
  // sl.registerLazySingleton(() => PostTokenPw(forgotPwRepository: sl()));
  // sl.registerLazySingleton(() => PutNewPw(forgotPwRepository: sl()));
  // sl.registerLazySingleton(() => GetRoomDetail(repository: sl()));
  // sl.registerLazySingleton(() => GetRoomType(repository: sl()));

   ///repo
  // sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
  //     networkInfo: sl(),
  //     loginLocalDataSource: sl(),
  //     loginRemoteDataSource: sl()));
  // sl.registerLazySingleton<ForgotPwRepository>(
  //     () => ForgotPwRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<ReviewOfflineRepository>(
      () => ReviewOfflineRepositoryImpl(networkInfo: sl(),reviewOfflineDataSource: sl()));

  ///data source
  sl.registerLazySingleton<ReviewOfflineDataSource>(
      () => ReviewOfflineDateSourceImpl(client: sl()));
  // sl.registerLazySingleton<LoginLocalDataSource>(
  //     () => LoginLocalDataSourceImpl(sharedPreferences: sl()));
  // sl.registerLazySingleton<ForgotPwRemoteDataSource>(
  //     () => ForgotPwRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<RoomRemoteDataSource>(
  //     () => RoomRemoteDataSourceImpl(sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
