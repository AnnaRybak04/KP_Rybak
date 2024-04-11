// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/remote/tv_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TVShowModelImpl _$$TVShowModelImplFromJson(Map<String, dynamic> json) =>
    _$TVShowModelImpl(
      id: json['id'] as int,
      originalName: json['original_name'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toDouble(),
      releaseDate: json['first_air_date'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      language: json['original_language'] as String,
      status: json['status'] as String?,
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TVShowModelImplToJson(_$TVShowModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'first_air_date': instance.releaseDate,
      'popularity': instance.popularity,
      'original_language': instance.language,
      'status': instance.status,
      'episode_run_time': instance.episodeRunTime,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
    };
