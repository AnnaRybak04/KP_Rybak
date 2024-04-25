// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/search_model.freezed.dart';
part '../../../generated/data/model/remote/search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  factory SearchModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'media_type') required String mediaType,
    @JsonKey(name: 'poster_path') required String? posterPath,
  }) = _SearchModel;

  factory SearchModel.fromJson(Json json) => _$SearchModelFromJson(json);
}
