import 'dart:async';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<bool> _observable = BehaviorSubject<bool>();
Future<bool> get _ready => _observable.first;

main(List<String> arguments) async {
  // Run a task that will take a while
  longTask().then((value) {
    _observable.add(value);
  });

  print("${DateTime.now()}\tStarting");
  for (var i = 0; i < 10; i++) {
    // Run a task that waits for the first task
    shortTask(i);
    await Future.delayed(Duration(milliseconds: 250));
  }
}

//Future _longTaskStatus;

Future longTask() {
  return Future.delayed(Duration(milliseconds: 1500));
}

void shortTask(int i) {
  _ready.then((value) {
    print("${DateTime.now()}\tShort task $i is complete");
  });
}
