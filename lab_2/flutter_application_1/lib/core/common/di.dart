import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/core/services/local_storage_service.dart';
import 'package:flutter_application_1/data/datasources/local_datasource.dart';
import 'package:flutter_application_1/data/datasources/remote_datasource.dart';
import 'package:flutter_application_1/domain/repositories/local_repository.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/films/bloc/movies_cubit.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  await LocalStorageService.init();
  serviceLocator.registerLazySingleton<MainRouter>(
    MainRouter.new,
  );

  final dio = Dio()
    ..options.headers['Authorization'] = 'Bearer ${GlobalConstants.authApiKey}'
    ..options.responseType = ResponseType.json
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  final remoteDatasource = RemoteDatasource(dio);

  final localDatasource = LocalDatasource(
    serviceLocator<Box>(instanceName: GlobalConstants.moviesStorage),
    serviceLocator<Box>(instanceName: GlobalConstants.tvShowsStorage),
    serviceLocator<Box>(instanceName: GlobalConstants.ratingStorage),
  );

  serviceLocator.registerLazySingleton(
    () => LocalRepository(localDatasource),
  );
  serviceLocator.registerLazySingleton(
    () => RemoteRepository(remoteDatasource, GlobalConstants.apiKey),
  );

  serviceLocator.registerLazySingleton<MainCubit>(
    () => MainCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<TVCubit>(
    () => TVCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MoviesCubit>(
    () => MoviesCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<FavoriteCubit>(
    () => FavoriteCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MediaDetailsCubit>(
    () => MediaDetailsCubit(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<SearchCubit>(
    () => SearchCubit(serviceLocator()),
  );
}

Future<void> reinitApi() async {
  await serviceLocator.reset();
  await init();
}
