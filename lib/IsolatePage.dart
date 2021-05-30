import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  @override
  _IsolatePageState createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Let's Isolate"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              RaisedButton(
                child: Text('Isolated'),
                onPressed: () async {
                  final sum =
                      await compute(computationallyExpensiveTask, 10000000000);
                  print(sum);
                },
              ),
              RaisedButton(
                child: Text('Normal'),
                onPressed: () async {
                  final sum = computationallyExpensiveTask(10000000000);
                  print(sum);
                },
              )
            ],
          ),
        ));
  }

  static int computationallyExpensiveTask(int value) {
    var sum = 0;
    for (var i = 0; i <= value; i++) {
      sum += i;
    }
    print('finished');
    return sum;
  }
}
