import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/presentation/favourite/pages/shows_grid.dart';
import 'package:flutter_application_1/presentation/rated/bloc/rated_cubit.dart';
import 'package:flutter_application_1/presentation/rated/bloc/rated_state.dart';
import 'package:flutter_application_1/shared/widgets/one_not_found.dart';
import 'package:flutter_application_1/shared/widgets/one_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatedPage extends StatelessWidget {
  const RatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OneScaffold(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: BlocBuilder<RatedCubit, RatedState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: PaddingConstants.extraLarge),
                Padding(
                  padding: const EdgeInsets.only(left: PaddingConstants.large),
                  child: Text(
                    'Оцінене',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.onSurface),
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

  Widget _buildBody(RatedState state) {
    if (state.status == MainStatus.error) {
      return Center(child: Text(state.errorMessage));
    } else if (state.status == MainStatus.initial) {
      if (state.movies.isEmpty && state.tvShows.isEmpty) {
        return const SizedBox(
          width: double.infinity,
          child: OneNotFound(),
        );
      } else {
        return ShowsGrid(tvShows: state.tvShows, movies: state.movies);
      }
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
