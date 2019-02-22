import 'dart:core';

main(List<String> arguments) async {
  timestamp("Non-await version");

  // Version 1: no await
  // Run a task that will take a while
  longTask().then((value) {
    timestamp("1: then() clause of longTask() inside main()");
  });

  timestamp("1: ==> This is the line of code *after* longTask()");

  await Future.delayed(Duration(seconds: 1));

  print("");
  timestamp("await version");

  // Version 2: await
  // Run a task that will take a while
  await longTask().then((value) {
    timestamp("2: then() clause of longTask() inside main()");
  });

  timestamp("2: ==> This is the line of code *after* await longTask()");
}

Future longTask() {
  return Future.delayed(Duration(milliseconds: 250)).then((value) {
    timestamp("This is longTask() at its completion in its then() function");
  });
}

void timestamp(String s) => print("${DateTime.now()}\t$s");
