import 'package:flutter/material.dart';
import 'package:hive_app/adapter2/person_2.dart';
import 'package:hive_app/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<PersonModel> list = [
//    PersonModel(name: 'Tung', age: 12),
//    PersonModel(name: 'Duc', age: 22),
//    PersonModel(name: 'Vinh', age: 25),
//    PersonModel(name: 'Hau', age: 28),
//  ];
//  Box<PersonModel> personBox;
//  List<Person> list = [
//    Person(name: 'Tung', age: 12),
//    Person(name: 'Duc', age: 22),
//    Person(name: 'Vinh', age: 25),
//    Person(name: 'Hau', age: 28),
//  ];
//  Box<Person> personBox;
  List<Person2> list = [
    Person2(name: 'Tung', age: 12),
    Person2(name: 'Duc', age: 22),
    Person2(name: 'Vinh', age: 25),
    Person2(name: 'Hau', age: 28),
  ];
  Box<Person2> personBox;

  @override
  void initState() {
    personBox = Hive.box(favoritesBox2);
//    personBox.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Test"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        // it listen multi value change
        valueListenable: personBox.listenable(),
        builder: (context, Box<Person2> box, widget) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text('${list[index].name} - ${list[index].age.toString()}'),
                trailing: IconButton(
                  icon: getIcon(index),
                  onPressed: () {
                    onFavoritePress(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(personBox.values);
        },
      ),
    );
  }

  Widget getIcon(int index) {
    if (personBox.containsKey(index)) { // check key have in box ?
      return Icon(
        Icons.favorite,
        color: Colors.blue,
      );
    }
    return Icon(
      Icons.favorite_border,
      color: Colors.green,
    );
  }

  void onFavoritePress(int index) {
//    if (personBox.containsKey(index)) {
//      print("b: " + personBox.containsKey(index).toString());
//      personBox.delete(index);
//      print('delete: $index');
//      return;
//    }
    personBox.put(index, list[index]);
    print("get: " + personBox.get(index).toString());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
