import 'package:flutter_application_1/core/enum/main_status_enum.dart';
import 'package:flutter_application_1/domain/entity/tv_show_response_item.dart';
import 'package:flutter_application_1/domain/repositories/remote_repository.dart';
import 'package:flutter_application_1/presentation/tv/bloc/tv_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TVCubit extends Cubit<TVState> {
  TVCubit(this.repository) : super(TVState.loading());
  final RemoteRepository repository;

  // Метод для пошуку телевізійних шоу за вказаною сторінкою.
  void search({required int page}) async {
    // Встановлення стану на завантаження.
    emit(state.copyWith(status: MainStatus.loading));
    try {
      // Отримання результату пошуку за вказаною сторінкою.
      final TVShowResponseItem result =
          await repository.getAllTVShows(page: page);
      // Додавання результатів до списку телевізійних шоу.
      state.tvShowsPagingController.appendPage(
        result.items,
        result.nextPage,
      );
      // Оновлення стану на початковий.
      emit(state.copyWith(status: MainStatus.initial));
    } catch (e) {
      // Виняток: оновлення стану на помилку з повідомленням про помилку.
      emit(
          state.copyWith(status: MainStatus.error, errorMessage: e.toString()));
    }
  }
}
