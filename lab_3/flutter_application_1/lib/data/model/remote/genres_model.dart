// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/genres_model.freezed.dart';
part '../../../generated/data/model/remote/genres_model.g.dart';

@freezed
// Клас GenresModel, який описує модель жанрів
class GenresModel with _$GenresModel {
// конструктор для створення об'єкту GenresModel
  factory GenresModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _GenresModel;

// метод для створення об'єкту GenresModel з JSON
  factory GenresModel.fromJson(Json json) => _$GenresModelFromJson(json);
}
