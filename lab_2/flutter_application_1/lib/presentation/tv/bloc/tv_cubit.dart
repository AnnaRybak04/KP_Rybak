import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/tv_show_response_item.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TVCubit extends Cubit<TVState> {
  TVCubit(this.repository) : super(TVState.loading());
  final RemoteRepository repository;

  void search({required int page}) async {
    emit(state.copyWith(status: MainStatus.loading));
    try {
      final TVShowResponseItem result = await repository.getAllTVShows(page: page);
      state.tvShowsPagingController.appendPage(
        result.items,
        result.nextPage,
      );
      emit(state.copyWith(status: MainStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
