import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/search_response_item.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.remoteRepository) : super(SearchState.loading());
  final RemoteRepository remoteRepository;

  void setSearchVisibility(bool isVisible) {
    emit(state.copyWith(isSearchVisible: isVisible));
  }

  void search(String query, {required int page}) async {
    if (query.isEmpty) return;
    state.pagingController.refresh();
    try {
      final SearchResponseItem result = await remoteRepository.search(query: query, page: page);
      state.pagingController.appendPage(
        result.items,
        result.nextPage,
      );
      emit(state.copyWith(status: MainStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
