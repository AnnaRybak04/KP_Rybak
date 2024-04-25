import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/common/di.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/films/bloc/movies_cubit.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/media_details/bloc/media_details_cubit.dart';
import 'package:flutter_application_1/presentation/rated/bloc/rated_cubit.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_cubit.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_cubit.dart';
import 'package:flutter_application_1/shared/router/main_router.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_cubit.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_state.dart';
import 'package:flutter_application_1/shared/theme/one_theme.dart';
import 'package:flutter_application_1/shared/widgets/one_scroll_behevior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneApp extends StatelessWidget {
  OneApp({super.key});
  final router = serviceLocator<MainRouter>().router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: OneTheme.lightThemeData,
            darkTheme: OneTheme.darkThemeData,
            themeMode: state.themeMode,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            scrollBehavior: OneMouseScrollBehavior(),
            builder: (context, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => serviceLocator<MainCubit>()..init(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<TVCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<SearchCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<MoviesCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<MediaDetailsCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<FavoriteCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => serviceLocator<RatedCubit>(),
                  ),
                ],
                child: child ?? const SizedBox(),
              );
            },
          );
        },
      ),
    );
  }
}
