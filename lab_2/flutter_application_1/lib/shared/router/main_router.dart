import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/favourite/pages/favourite_page.dart';
import 'package:flutter_application_1/presentation/films/movies_page.dart';
import 'package:flutter_application_1/presentation/main/pages/main_page.dart';
import 'package:flutter_application_1/presentation/media_details/pages/movie_details_page.dart';
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

class MainRouter {
  final GlobalKey<NavigatorState> _mainRouterKey = GlobalKey<NavigatorState>(debugLabel: 'NavigatorState');
  final GlobalKey<NavigatorState> _tabShellRouterKey = GlobalKey<NavigatorState>(debugLabel: '_tabShellRouterKey');

  late GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: MainRoutePath.home,
    navigatorKey: _mainRouterKey,
    routes: [
      getDetailedMovieRoute(),
      ShellRoute(
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
      return MultiplatformPage.create(
        key: state.pageKey,
        child: Container(color: Colors.black),
      );
    },
    redirect: (BuildContext context, GoRouterState state) async {
      return null;
    },
  );

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
