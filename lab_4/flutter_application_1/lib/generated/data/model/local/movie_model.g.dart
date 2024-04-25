// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/local/movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      id: fields[1] as int,
      title: fields[2] as String,
      language: fields[3] as String,
      originalTitle: fields[4] as String,
      overview: fields[5] as String,
      posterPath: fields[6] as String,
      voteAverage: fields[7] as double,
      voteCount: fields[8] as double,
      releaseDate: fields[9] as String,
      popularity: fields[10] as double,
      rating: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.posterPath)
      ..writeByte(7)
      ..write(obj.voteAverage)
      ..writeByte(8)
      ..write(obj.voteCount)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
