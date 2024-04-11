// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:flutter_application_1/data/model/remote/tv_show_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/tv_show_response_model.freezed.dart';
part '../../../generated/data/model/remote/tv_show_response_model.g.dart';

@freezed
class TVShowResponseModel with _$TVShowResponseModel {
  factory TVShowResponseModel({
    @JsonKey(name: 'results') required List<TVShowModel> items,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _TVShowResponseModel;

// Конструктор для десеріалізації JSON
  factory TVShowResponseModel.fromJson(Json json) => _$TVShowResponseModelFromJson(json);
}
