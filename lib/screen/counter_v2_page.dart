import 'package:flutter/material.dart';
import 'package:flutteruitest/provider/counter.dart';
import 'package:provider/provider.dart';

class CounterV2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (BuildContext context, Counter counter, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Counter V2"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counter.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
