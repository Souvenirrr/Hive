import 'package:hive/hive.dart';

void main() async {
  var box = await Hive.openBox('testBox');

  var initialList = ['a', 'b', 'c'];
  var initialList1 = ['c', 'd', 'e'];

  box.put('myList', initialList);
  box.put('myList1', initialList1);
  print(box.values);

  var myList = box.get('myList');
  myList[0] = 'd';

  print(initialList[0]); // d
}