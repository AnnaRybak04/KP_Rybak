// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/list_extension.dart';
import 'package:flutter_application_1/core/enum/content_type_enum.dart';
import 'package:flutter_application_1/core/resourses/constants.dart';
import 'package:flutter_application_1/data/model/remote/search_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/entity/search_item.freezed.dart';

@freezed
class SearchItem with _$SearchItem {
  factory SearchItem({
    required int id,
    required String name,
    required ContentTypeEnum? mediaType,
    required String posterPath,
  }) = _SearchItem;

  factory SearchItem.empty() {
    return SearchItem(
      id: 0,
      name: '',
      mediaType: ContentTypeEnum.movies,
      posterPath: '',
    );
  }

  const SearchItem._();

  factory SearchItem.fromRemoteModel(SearchModel model) {
    return SearchItem(
      id: model.id,
      posterPath: model.posterPath ?? '',
      name: model.name ?? model.title ?? '',
      mediaType: ContentTypeEnum.values.firstWhereOrNull((element) => element.value == model.mediaType),
    );
  }

  String get imageUrl => GlobalConstants.baseImageUrl + posterPath;
}
