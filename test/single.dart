import 'package:rxdart/rxdart.dart';

void main() {
  var subject = BehaviorSubject<List<String>>();
//  ConcatEagerStream(
//          [Stream.fromFuture(getData1()), Stream.fromFuture(getData2())])
//      .listen(print);
//  TimerStream(1, Duration(seconds: 10)).concatWith([
//    Stream.fromIterable([2]).concatWith([
//      Stream.fromIterable([3])
//    ])
//  ]).listen(print);

  MergeStream([
    TimerStream(1, Duration(seconds: 3)),
    TimerStream(1, Duration(seconds: 5)),
    Stream.fromIterable([2], )
  ])
      .listen(print);

  //subject.listen(print);
//  List<String> list = [];
//
//  list.add('123');
//  list.add('456');
//  list.add('789');
//  subject.add(list);
////  subject.listen((val){
////    print('a: $val');
////  });
//  list.add('1111');
//  list.add('2222');
////  subject.listen((val){
////    print('b: $val');
////  });
}

Future<List<int>> getData1() {
  List<int> list = [];
  list.add(1);
  list.add(2);
  list.add(3);
  list.add(4);
  return Future.value(list);
}

Future<List<String>> getData2() {
  List<String> list2 = [];
  list2.add('a');
  list2.add('b');
  list2.add('c');
  list2.add('d');
  return Future.delayed(Duration(seconds: 5), () {
    return list2;
  });
}
