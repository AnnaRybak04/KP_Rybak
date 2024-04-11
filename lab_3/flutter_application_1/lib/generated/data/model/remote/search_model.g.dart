// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/remote/search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchModelImpl _$$SearchModelImplFromJson(Map<String, dynamic> json) =>
    _$SearchModelImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      title: json['title'] as String?,
      mediaType: json['media_type'] as String,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$SearchModelImplToJson(_$SearchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'media_type': instance.mediaType,
      'poster_path': instance.posterPath,
    };
