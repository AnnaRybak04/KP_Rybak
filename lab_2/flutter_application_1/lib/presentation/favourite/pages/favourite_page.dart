import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_cubit.dart';
import 'package:flutter_application_1/presentation/favourite/bloc/favourite_state.dart';
import 'package:flutter_application_1/presentation/favourite/pages/favourite_shows_grid.dart';
import 'package:flutter_application_1/shared/theme/app_color.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: PaddingConstants.extraLarge),
                const Padding(
                  padding: EdgeInsets.only(left: PaddingConstants.large),
                  child: Text(
                    'Збережене:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: PaddingConstants.extraLarge),
                Expanded(child: _buildBody(state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(FavoriteState state) {
    if (state.status == MainStatus.error) {
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      if (state.movies.isEmpty && state.tvShows.isEmpty) {
        return const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off,
                size: 100,
                color: AppColor.iconsGrey,
              ),
              SizedBox(height: PaddingConstants.medium),
              Text(
                'Нічого не знайдено',
                style: TextStyle(
                  color: AppColor.iconsGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        );
      } else {
        return FavouriteShowGrid(tvShows: state.tvShows, movies: state.movies);
      }
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
