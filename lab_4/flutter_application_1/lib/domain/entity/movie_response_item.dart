// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/data/model/remote/movie_response_model.dart';
import 'package:flutter_application_1/domain/entity/movie_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/movie_response_item.freezed.dart';

@freezed
class MovieResponseItem with _$MovieResponseItem {
  //створення екземпляру класу
  factory MovieResponseItem({
    required List<MovieItem> items,
    required int totalPages,
    required int page,
    required int totalResults,
  }) = _MovieResponseItem;

  const MovieResponseItem._();

  //перетворення моделі MovieResponseModel у MovieResponseItem
  factory MovieResponseItem.fromModel(MovieResponseModel model) {
    return MovieResponseItem(
      items: model.items.map(MovieItem.fromRemoteModel).toList(),
      totalPages: model.totalPages,
      page: model.page,
      totalResults: model.totalResults,
    );
  }

  // Метод для отримання номера наступної сторінки, якщо така існує
  int? get nextPage {
    if (page < totalPages) {
      return page + 1;
    } else {
      return null;
    }
  }
}
