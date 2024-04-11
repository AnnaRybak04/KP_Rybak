// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/remote/search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResponseModelImpl _$$SearchResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchResponseModelImpl(
      items: (json['results'] as List<dynamic>)
          .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      page: json['page'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$$SearchResponseModelImplToJson(
        _$SearchResponseModelImpl instance) =>
    <String, dynamic>{
      'results': instance.items.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'page': instance.page,
      'total_results': instance.totalResults,
    };
