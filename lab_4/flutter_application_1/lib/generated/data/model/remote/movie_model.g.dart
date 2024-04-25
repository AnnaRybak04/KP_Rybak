// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/remote/movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieModelImpl _$$MovieModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieModelImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      language: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget: json['budget'] as int?,
    );

Map<String, dynamic> _$$MovieModelImplToJson(_$MovieModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_language': instance.language,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'release_date': instance.releaseDate,
      'popularity': instance.popularity,
      'status': instance.status,
      'tagline': instance.tagline,
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'budget': instance.budget,
    };
