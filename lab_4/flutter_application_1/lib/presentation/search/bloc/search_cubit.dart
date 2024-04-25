import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/search_response_item.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/search/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  // Клас, який відповідає за стан і логіку пошуку
  SearchCubit(this.remoteRepository) : super(SearchState.loading());
  final RemoteRepository remoteRepository;

  // Метод для зміни видимості пошукового поля
  void setSearchVisibility(bool isVisible) {
    emit(state.copyWith(isSearchVisible: isVisible));
  }

  // Метод для виконання пошуку з використанням заданого запиту та сторінки
  void search(String query, {required int page}) async {
    if (query.isEmpty) return;
    state.pagingController.refresh();
    try {
      // Виконуємо пошук за допомогою віддаленого репозиторію
      final SearchResponseItem result = await remoteRepository.search(query: query, page: page);
      // Оновлюємо сторінку з отриманими даними
      state.pagingController.appendPage(
        result.items,
        result.nextPage,
      );
      // Повідомляємо про успішне завершення пошуку
      emit(state.copyWith(status: MainStatus.initial));
    } catch (e) {
      // У випадку помилки повідомляємо про її виникнення та передаємо повідомлення про помилку
      emit(state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
