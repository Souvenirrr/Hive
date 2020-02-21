// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person3.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Person3Adapter extends TypeAdapter<Person3> {
  @override
  final typeId = 2;

  @override
  Person3 read(BinaryReader reader) {
    return Person3()
      ..name = reader.read()
      ..age = reader.read()
      ..hiveList = reader.read();
  }

  @override
  void write(BinaryWriter writer, Person3 obj) {
    writer..write(obj.name)..write(obj.age)..write(obj.hiveList);
  }
}
