// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/remote/tv_show_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TVShowResponseModelImpl _$$TVShowResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TVShowResponseModelImpl(
      items: (json['results'] as List<dynamic>)
          .map((e) => TVShowModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$TVShowResponseModelImplToJson(
        _$TVShowResponseModelImpl instance) =>
    <String, dynamic>{
      'results': instance.items.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'page': instance.page,
      'total_results': instance.totalResults,
    };
