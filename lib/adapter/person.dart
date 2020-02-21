import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:hive_app/adapter2/person_2.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class PersonModel{
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  Person2 abc;

  PersonModel({this.name, this.age});

  @override
  String toString() => name; // just for print
}

//class Person{
//  final String name;
//  final int age;
//
//  Person({this.name, this.age});
//
//  @override
//  String toString() => Person().toString();
//}