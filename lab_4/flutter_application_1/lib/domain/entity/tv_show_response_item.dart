// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/data/model/remote/tv_show_response_model.dart';
import 'package:flutter_application_1/domain/entity/tv_show_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/tv_show_response_item.freezed.dart';

@freezed
class TVShowResponseItem with _$TVShowResponseItem {
  factory TVShowResponseItem({
    required List<TVShowItem> items,
    required int totalPages,
    required int page,
    required int totalResults,
  }) = _TVShowResponseItem;

  const TVShowResponseItem._();

  //метод для створення TVShowResponseItem з моделі TVShowResponseModel
  factory TVShowResponseItem.fromModel(TVShowResponseModel model) {
    return TVShowResponseItem(
      items: model.items.map(TVShowItem.fromRemoteModel).toList(),
      totalPages: model.totalPages,
      page: model.page,
      totalResults: model.totalResults,
    );
  }

  // Метод, що повертає номер наступної сторінки, якщо вона існує
  int? get nextPage {
    if (page < totalPages) {
      return page + 1;
    } else {
      return null;
    }
  }
}
