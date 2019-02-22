# Test runs

## General observations

It looks like `then()` functions are called in a nearest-to-farthest order, i.e. the function currently executing gets its `then()` function, then one level up the stack, etc. etc.

## Simple case: not using async or deferred code inside the then() function

So it looks like `await func().then()` awaits _everything_, at least when there's nothing async or deferred intside the then() function.

```
2019-02-22 18:46:14.757532      Non-await version
2019-02-22 18:46:14.767530      1: ==> This is the line of code *after* longTask()
2019-02-22 18:46:15.019052      This is longTask() at its completion in its then() function
2019-02-22 18:46:15.019052      1: then() clause of longTask() inside main()

2019-02-22 18:46:15.770048      await version
2019-02-22 18:46:16.021067      This is longTask() at its completion in its then() function
2019-02-22 18:46:16.022067      2: then() clause of longTask() inside main()
2019-02-22 18:46:16.022067      2: ==> This is the line of code *after* await longTask()
```
