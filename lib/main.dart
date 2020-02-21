import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/adapter2/person_2.dart';
import 'package:hive_app/adapter3/person3.dart';
import 'package:hive_app/pages/relationship_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_app/pages/home.dart';


const favoritesBox = 'favorites';
const favoritesBox2 = 'favorites2';
const favoritesBox3 = 'favorites3';

Future person2() async{
  //adapter register before open box
  Hive.registerAdapter(Person2Adapter());
  await Hive.initFlutter();
  //await Hive.openBox<PersonModel>(favoritesBox);
  await Hive.openBox<Person2>(favoritesBox2);
}

Future person3() async{
  //adapter register before open box
  Hive.registerAdapter(Person3Adapter());
  await Hive.initFlutter();
  //await Hive.openBox<PersonModel>(favoritesBox);
  var lazyBox = await Hive.openBox<Person3>(favoritesBox, compactionStrategy: (entries, deleted ){
    return deleted > 2;
  }, crashRecovery: false, );
  //await lazyBox.get('lazyVal');
}

void main() async{
  await person3();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Relationship(),
      //home: Relationship(),
    );
  }
}