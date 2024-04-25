// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:flutter_application_1/data/model/remote/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/movie_response_model.freezed.dart';
part '../../../generated/data/model/remote/movie_response_model.g.dart';

@freezed
class MovieResponseModel with _$MovieResponseModel {
  factory MovieResponseModel({
    @JsonKey(name: 'results') required List<MovieModel> items,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponseModel;

 // Конструктор для десеріалізації JSON
  factory MovieResponseModel.fromJson(Json json) => _$MovieResponseModelFromJson(json);
}
