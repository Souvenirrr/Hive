import 'package:flutter/material.dart';
import 'package:hive_app/adapter3/person3.dart';
import 'package:hive_app/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Relationship extends StatefulWidget {
  @override
  _RelationshipState createState() => _RelationshipState();
}

class _RelationshipState extends State<Relationship> {
  List<Person3> list = [
    Person3(name: 'Tung', age: 12),
    Person3(name: 'Duc', age: 22),
    Person3(name: 'Vinh', age: 25),
    Person3(name: 'Hau', age: 18),
  ];
  Person3 boss = Person3(name: 'Boss', age: 8);
  Person3 lan = Person3(name: 'Lan', age: 8);
  Box<Person3> personBox;

  @override
  void initState() {
    personBox = Hive.box(favoritesBox);
    personBox.put('boss', boss);
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
        builder: (context, Box<Person3> box, _) {
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
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print(personBox.values);
              print("list: " + personBox.get('boss').hiveList.toString());
//          print("list1: " + personBox.get(0).hiveList.toString());
//          print("key: " + personBox.get(0).key.toString());
              var filteredUsers = personBox.values.where((user) => user.name.toLowerCase().startsWith("v"));
              print("filtered: " + filteredUsers.toString());
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.music_note),
            onPressed: (){
              personBox.put(1, lan);
            },
          ),
        ],
      ),
    );
  }

  Widget getIcon(int index) {
    if (personBox.containsKey(index)) {
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
    if (personBox.containsKey(index)) {
      print("b: " + personBox.containsKey(index).toString());
      personBox.delete(index);
      print('delete: $index');
      return;
    }
    personBox.put(index, list[index]);

    // init hive list and add element to hive list
    personBox.get('boss').hiveList = HiveList(personBox);

    personBox.get('boss').hiveList.addAll(personBox.values); // if only add one element
    print(personBox.get('boss').hiveList.toString());
      //personBox.get(0) == null
//    personBox.get(0).hiveList = HiveList(personBox);
//    personBox.get(0).hiveList.addAll(personBox.values);

      // add must just receive last element
//    boss.hiveList.add(personBox.get(index));
    //delete hive list
    //boss.delete();
    print("get: " + personBox.get(index).toString());
  }

  @override
  void dispose() {
    Hive.box(favoritesBox).compact();
    Hive.close();
    super.dispose();
  }
}
