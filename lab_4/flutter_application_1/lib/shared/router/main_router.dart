import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/favourite/pages/favourite_page.dart';
import 'package:flutter_application_1/presentation/films/movies_page.dart';
import 'package:flutter_application_1/presentation/main/pages/main_page.dart';
import 'package:flutter_application_1/presentation/media_details/pages/movie_details_page.dart';
import 'package:flutter_application_1/presentation/rated/bloc/rated_cubit.dart';
import 'package:flutter_application_1/presentation/rated/pages/rated_page.dart';
import 'package:flutter_application_1/presentation/search/pages/mobile_search_page.dart';
import 'package:flutter_application_1/presentation/search/pages/search_wrapper.dart';
import 'package:flutter_application_1/presentation/tv/pages/tv_shows_page.dart';
import 'package:flutter_application_1/shared/router/main_router_name.dart';
import 'package:flutter_application_1/shared/router/multiplatform_page.dart';
import 'package:flutter_application_1/shared/widgets/layout_helper.dart';
import 'package:flutter_application_1/shared/widgets/one_app_bar.dart';
import 'package:flutter_application_1/shared/widgets/one_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Головний роутер додатку
class MainRouter {
  final GlobalKey<NavigatorState> _mainRouterKey = GlobalKey<NavigatorState>(debugLabel: 'NavigatorState');
  final GlobalKey<NavigatorState> _tabShellRouterKey = GlobalKey<NavigatorState>(debugLabel: '_tabShellRouterKey');

  // Оголошуємо екземпляр GoRouter
  late GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: MainRoutePath.home,
    navigatorKey: _mainRouterKey,
    routes: [
      getDetailedMovieRoute(),
      ShellRoute(
        // Обгортка для таб-бару
        builder: (
          BuildContext context,
          GoRouterState state,
          Widget child,
        ) {
          return Scaffold(
            appBar: LayoutHelper.isDesktopScreen(context) ? null : const OneAppBar(),
            drawer: LayoutHelper.isDesktopScreen(context) ? null : const OneDrawer(),
            body: SearchWrapper(child: child),
          );
        },
        navigatorKey: _tabShellRouterKey,
        routes: [
          GoRoute(
            // Шлях для головної сторінки
            name: MainRouteName.home,
            path: MainRoutePath.home,
            pageBuilder: (context, state) {
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const MainPage(),
              );
            },
          ),
          GoRoute(
            // Шлях для сторінки фільмів
            name: MainRouteName.films,
            path: MainRoutePath.films,
            pageBuilder: (context, state) {
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const MoviesPage(),
              );
            },
          ),
          GoRoute(
            // Шлях для сторінки телепередач
            name: MainRouteName.tvShows,
            path: MainRoutePath.tvShows,
            pageBuilder: (context, state) {
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const TVShowPage(),
              );
            },
          ),
          GoRoute(
            // Шлях для сторінки обраного
            name: MainRouteName.favourite,
            path: MainRoutePath.favourite,
            pageBuilder: (context, state) {
              BlocProvider.of<FavoriteCubit>(context).init();
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const FavoritePage(),
              );
            },
          ),
          GoRoute(
            name: MainRouteName.rated,
            path: MainRoutePath.rated,
            pageBuilder: (context, state) {
              BlocProvider.of<RatedCubit>(context).init();
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const RatedPage(),
              );
            },
          ),
          GoRoute(
            // Шлях для сторінки пошуку
            name: MainRouteName.search,
            path: MainRoutePath.search,
            pageBuilder: (context, state) {
              return MultiplatformPage.create(
                key: ValueKey(state.pageKey),
                name: state.uri.toString(),
                child: const MobileSearchPage(),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      // Сторінка помилки
      return MultiplatformPage.create(
        key: state.pageKey,
        child: Container(color: Colors.black),
      );
    },
    redirect: (BuildContext context, GoRouterState state) async {
      return null;
    },
  );

  // Метод для отримання шляху для деталей фільму
  GoRoute getDetailedMovieRoute() {
    return GoRoute(
      name: MainRouteName.movieDetails,
      path: MainRoutePath.movieDetails,
      pageBuilder: (context, state) {
        return MultiplatformPage.create(
          key: ValueKey(state.pageKey),
          name: state.uri.toString(),
          child: const MovieDetailsPage(),
        );
      },
    );
  }
}
