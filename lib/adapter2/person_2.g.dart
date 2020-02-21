// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Person2Adapter extends TypeAdapter<Person2> {
  @override
  final typeId = 1;

  @override
  Person2 read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person2(
      name: fields[0] as String,
      age: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Person2 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age);
  }
}
