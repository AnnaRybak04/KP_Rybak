// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_application_1/core/common/di.dart';
import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

//Клас для управління локальним сховищем даних
class LocalStorageService {
  LocalStorageService();

  static const int maxRetries = 3;
  //виконання функціюї, яка передається як параметр, та відстежується кількість спроб, що були виконані.
  static Future<void> execute(Function() func, int count) async {
    if (count <= maxRetries) {
      await func();
    } else {
      throw Exception('LocalStorageService: Failed to initialize Hive after $maxRetries retries');
    }
  }

  static Future<void> init({int retryCount = 0}) async {
    try {
      //ініціалізація пакету Hive для використання у Flutter додатку
      await Hive.initFlutter();
      // NOTE: Adapters MUST BE registered BEFORE opening a box
      //Реєстрація адаптерів для моделей даних MovieModel та TVShowModel
      Hive.registerAdapter(MovieModelAdapter());
      Hive.registerAdapter(TVShowModelAdapter());
      await openBox();
    } catch (e) {
      //Видалення боксів з диску для попереднього зберігання даних
      await Hive.deleteBoxFromDisk(GlobalConstants.favouriteMoviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.favouriteTvShowsStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratedMoviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratedTvShowsStorage);
      await execute(() => init(retryCount: retryCount + 1), retryCount + 1);
    }
  }
// Метод відкриття коробок Hive для конкретних типів даних і реєстрацію їх у сервісі-локаторі
// та відстеження помилок
  static Future<void> openBox({int retryCount = 0}) async {
    try {
      final Box moviesBox = await Hive.openBox(GlobalConstants.favouriteMoviesStorage);
      final Box tvShowsBox = await Hive.openBox(GlobalConstants.favouriteTvShowsStorage);
      final Box ratedMoviesBox = await Hive.openBox(GlobalConstants.ratedMoviesStorage);
      final Box ratedTvShowsBox = await Hive.openBox(GlobalConstants.ratedTvShowsStorage);
      serviceLocator.registerLazySingleton<Box>(
        () => moviesBox,
        instanceName: GlobalConstants.favouriteMoviesStorage,
      );
      serviceLocator.registerLazySingleton<Box>(
        () => tvShowsBox,
        instanceName: GlobalConstants.favouriteTvShowsStorage,
      );
      serviceLocator.registerLazySingleton<Box>(
        () => ratedMoviesBox,
        instanceName: GlobalConstants.ratedMoviesStorage,
      );
      serviceLocator.registerLazySingleton<Box>(
        () => ratedTvShowsBox,
        instanceName: GlobalConstants.ratedTvShowsStorage,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(GlobalConstants.favouriteMoviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.favouriteTvShowsStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratedMoviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratedTvShowsStorage);
      await execute(() => openBox(retryCount: retryCount + 1), retryCount + 1);
    }
  }
}
