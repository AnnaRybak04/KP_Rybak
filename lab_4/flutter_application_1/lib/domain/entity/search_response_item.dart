// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/data/model/remote/search_response_model.dart';
import 'package:flutter_application_1/domain/entity/search_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/search_response_item.freezed.dart';

@freezed
class SearchResponseItem with _$SearchResponseItem {
  factory SearchResponseItem({
    required List<SearchItem> items,
    required int totalPages,
    required int page,
    required int totalResults,
  }) = _SearchResponseItem;

  const SearchResponseItem._();

  //метод для перетворення з об'єкту моделі
  factory SearchResponseItem.fromModel(SearchResponseModel model) {
    return SearchResponseItem(
      items: model.items.map(SearchItem.fromRemoteModel).toList(),
      totalPages: model.totalPages,
      page: model.page,
      totalResults: model.totalResults,
    );
  }

  // Повертає номер наступної сторінки або null, якщо це остання сторінка
  int? get nextPage {
    if (page < totalPages) {
      return page + 1;
    } else {
      return null;
    }
  }
}
