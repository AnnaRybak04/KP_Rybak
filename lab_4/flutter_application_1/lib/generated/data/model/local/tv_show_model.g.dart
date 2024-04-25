// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../data/model/local/tv_show_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TVShowModelAdapter extends TypeAdapter<TVShowModel> {
  @override
  final int typeId = 1;

  @override
  TVShowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TVShowModel(
      id: fields[1] as int,
      originalName: fields[2] as String,
      overview: fields[3] as String,
      posterPath: fields[4] as String,
      voteAverage: fields[5] as double,
      voteCount: fields[6] as double,
      releaseDate: fields[7] as String,
      popularity: fields[8] as double,
      language: fields[9] as String,
      rating: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TVShowModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.originalName)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.voteCount)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TVShowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
