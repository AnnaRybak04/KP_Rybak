// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:flutter_application_1/data/model/remote/search_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/search_response_model.freezed.dart';
part '../../../generated/data/model/remote/search_response_model.g.dart';

@freezed
class SearchResponseModel with _$SearchResponseModel {
  factory SearchResponseModel({
    @JsonKey(name: 'results') required List<SearchModel> items,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _SearchResponseModel;

// Конструктор для десеріалізації JSON
  factory SearchResponseModel.fromJson(Json json) => _$SearchResponseModelFromJson(json);
}
