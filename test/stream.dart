import 'dart:async';

void main() async {
  final StreamController ctrl = StreamController.broadcast();
  final StreamSubscription subscription = ctrl.stream.listen((data) => print('$data'));

  ctrl.sink.add('my name');
//  await Future.delayed(Duration(seconds: 3),(){
//    ctrl.sink.add(123);
//  });
  subscription.pause(Future.delayed(Duration(seconds: 3)));
  subscription.onDone(ctrl.onListen);
  ctrl.sink.add({'a': 'element A', 'b': 'element B'});
  ctrl.sink.add(123.45);
  await Future.delayed(Duration(seconds: 4), (){
    print('aaa');
  });
  ctrl.sink.add(123.45);
  ctrl.sink.add(123.45);
  subscription.pause(Future.delayed(Duration(seconds: 3)));
  //subscription.resume();
  ctrl.sink.add(123.45);
  ctrl.sink.add(123.45);
  ctrl.sink.add(123.45);
  ctrl.close();


//  var controller = StreamController<int>();
//
//  // Create StreamTransformer with transformer closure
//  var streamTransformer = StreamTransformer<int, int>.fromHandlers(
//    handleData: (int data, EventSink sink) {
//      sink.add(data * 2);
//    },
//    handleError: (error, stacktrace, sink) {
//      sink.addError('Something went wrong: $error');
//    },
//    handleDone: (sink) {
//      sink.close();
//    },
//  );
//
//  // Call the `transform` method on the controller's stream
//  // while passing in the stream transformer
//  var controllerStream = controller.stream.transform(streamTransformer);
//
//  controllerStream.distinct().listen(print);
//
//  controller.sink.add(1);
//  controller.sink.add(2);
//  controller.sink.add(3);
//  controller.sink.add(4);
//  controller.sink.add(5);
//  controller.sink.add(6);
//  controller.sink.add(7);
//  controller.sink.add(8);
//  controller.sink.add(9);
//  controller.sink.add(10);
//
//  controller.close();
}