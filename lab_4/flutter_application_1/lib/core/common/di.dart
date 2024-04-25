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
import 'package:flutter_application_1/presentation/rated/bloc/rated_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final GetIt serviceLocator = GetIt.instance; // Створюємо інстанс контейнера залежностей.

Future<void> init() async {
  await LocalStorageService.init(); // Ініціалізуємо сервіс локального сховища.
  serviceLocator.registerLazySingleton<MainRouter>(
    MainRouter.new, // Реєструємо головний маршрутизатор як лінивий синглтон.
  );

  final dio = Dio()  // Створюємо об'єкт Dio для здійснення HTTP-запитів.
    ..options.headers['Authorization'] = 'Bearer ${GlobalConstants.authApiKey}'  // Додаємо заголовок авторизації.
    ..options.responseType = ResponseType.json // Встановлюємо тип відповіді в JSON.
    ..interceptors.add(
      LogInterceptor(
         // Додаємо перехоплювач для відлагодження, щоб виводити логи запитів та відповідей.
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    );
    // Створюємо віддалене джерело даних з використанням Dio.
  final remoteDatasource = RemoteDatasource(dio);

  final localDatasource = LocalDatasource(
    // Створюємо локальне джерело даних з використанням Hive.
    serviceLocator<Box>(instanceName: GlobalConstants.favouriteMoviesStorage), // Отримуємо доступ до сховища Movies.
    serviceLocator<Box>(instanceName: GlobalConstants.favouriteTvShowsStorage), // Отримуємо доступ до сховища TVShows.
    serviceLocator<Box>(instanceName: GlobalConstants.ratedMoviesStorage),// Отримуємо доступ до сховища Ratings.
    serviceLocator<Box>(instanceName: GlobalConstants.ratedTvShowsStorage), 
  );

  serviceLocator.registerLazySingleton(
    // Реєструємо LazySingleton локального репозиторію.
    () => LocalRepository(localDatasource),
  );
  serviceLocator.registerLazySingleton(
    // Реєструємо LazySingleton віддаленого репозиторію.
    () => RemoteRepository(remoteDatasource, GlobalConstants.apiKey),
  );

  serviceLocator.registerLazySingleton<MainCubit>(
    () => MainCubit(
      serviceLocator(), // Отримуємо доступ до локального репозиторію.
      serviceLocator(), // Отримуємо доступ до віддаленого репозиторію.
    ),
  );
  serviceLocator.registerLazySingleton<TVCubit>(
    // Реєструємо LazySingleton телешоу.
    () => TVCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MoviesCubit>(
    // Реєструємо LazySingleton кубіту фільмів.
    () => MoviesCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<FavoriteCubit>(
    // Реєструємо LazySingleton кубіту обраного.
    () => FavoriteCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<RatedCubit>(
    () => RatedCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MediaDetailsCubit>(
    // Реєструємо LazySingleton кубіту деталей медіа.
    () => MediaDetailsCubit(serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerLazySingleton<SearchCubit>(
    // Реєструємо LazySingleton кубіту пошуку.
    () => SearchCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ThemeCubit>(
    ThemeCubit.new,
  );
}

Future<void> reinitApi() async {
  await serviceLocator.reset(); // Скидаємо контейнер залежностей.
  await init(); // Ініціалізуємо залежності знову.
}
