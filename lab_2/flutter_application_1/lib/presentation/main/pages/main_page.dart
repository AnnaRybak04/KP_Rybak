import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_cubit.dart';
import 'package:flutter_application_1/presentation/main/bloc/main_state.dart';
import 'package:flutter_application_1/presentation/main/pages/widgets/movie_cards.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OneScaffold(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: PaddingConstants.extraLarge,
                        horizontal: PaddingConstants.medium,
                      ),
                      child: Text(
                        'Тренди',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 440,
                      child: _buildBody(state, state.trandingMovies),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: PaddingConstants.extraLarge,
                        horizontal: PaddingConstants.medium,
                      ),
                      child: Text(
                        'Найвищий рейтинг',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 440,
                      child: _buildBody(state, state.popularMovies),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(MainState state, List<MovieItem> movies) {
    if (state.status == MainStatus.error) {
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      return MovieCards(movies: movies, favouriteMovies: state.favouriteMovies);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
