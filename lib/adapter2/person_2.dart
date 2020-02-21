import 'package:hive/hive.dart';

part 'person_2.g.dart';

@HiveType(typeId: 1)
class Person2 extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  Person2({this.name, this.age});

  @override
  String toString() => name;
}