// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_application_1/core/common/di.dart';
import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/local/movie_model.dart';
import 'package:flutter_application_1/data/model/local/tv_show_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  LocalStorageService();

  static const int maxRetries = 3;
  static Future<void> execute(Function() func, int count) async {
    if (count <= maxRetries) {
      await func();
    } else {
      throw Exception('LocalStorageService: Failed to initialize Hive after $maxRetries retries');
    }
  }

  static Future<void> init({int retryCount = 0}) async {
    try {
      await Hive.initFlutter();
      // NOTE: Adapters MUST BE registered BEFORE opening a box
      Hive.registerAdapter(MovieModelAdapter());
      Hive.registerAdapter(TVShowModelAdapter());
      await openBox();
    } catch (e) {
      await Hive.deleteBoxFromDisk(GlobalConstants.moviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.tvShowsStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratingStorage);
      await execute(() => init(retryCount: retryCount + 1), retryCount + 1);
    }
  }

  static Future<void> openBox({int retryCount = 0}) async {
    try {
      final Box moviesBox = await Hive.openBox(GlobalConstants.moviesStorage);
      final Box tvShowsBox = await Hive.openBox(GlobalConstants.tvShowsStorage);
      final Box ratingBox = await Hive.openBox(GlobalConstants.ratingStorage);
      serviceLocator.registerLazySingleton<Box>(() => moviesBox, instanceName: GlobalConstants.moviesStorage);
      serviceLocator.registerLazySingleton<Box>(() => tvShowsBox, instanceName: GlobalConstants.tvShowsStorage);
      serviceLocator.registerLazySingleton<Box>(() => ratingBox, instanceName: GlobalConstants.ratingStorage);
    } catch (e) {
      await Hive.deleteBoxFromDisk(GlobalConstants.moviesStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.tvShowsStorage);
      await Hive.deleteBoxFromDisk(GlobalConstants.ratingStorage);
      await execute(() => openBox(retryCount: retryCount + 1), retryCount + 1);
    }
  }
}
