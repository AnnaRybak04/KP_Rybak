// ignore_for_file: invalid_annotation_target

import 'package:flutter_application_1/core/common/serializable_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/data/model/remote/production_model.freezed.dart';
part '../../../generated/data/model/remote/production_model.g.dart';

@freezed
class ProductionModel with _$ProductionModel {
  factory ProductionModel({
    @JsonKey(name: 'name') required String name,
  }) = _ProductionModel;

  factory ProductionModel.fromJson(Json json) => _$ProductionModelFromJson(json);
}
