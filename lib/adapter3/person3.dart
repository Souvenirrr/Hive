import 'package:hive/hive.dart';
import 'package:hive_app/pages/relationship_page.dart';

part 'person3.g.dart';

@HiveType(typeId: 2)
class Person3 extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  HiveList hiveList;

  Person3({this.name, this.age, this.hiveList});

  @override
  String toString() => name;
}