import 'dart:async';

main(List<String> arguments) async {
  // Run a task that will take a while
  _longTaskStatus = longTask();

  print("${DateTime.now()}\tStarting");
  for (var i = 0; i < 10; i++) {
    // Run a task that waits for the first task
    shortTask();
    await Future.delayed(Duration(milliseconds: 250));
  }
}

Future _longTaskStatus;

Future longTask() {
  return Future.delayed(Duration(milliseconds: 1500));
}

void shortTask() {
  _longTaskStatus.then((value) {
    print("${DateTime.now()}\tlong Task is complete");
  });
}
