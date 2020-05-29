import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SimpleCounter extends StatefulWidget {
  @override
  _SimpleCounterState createState() => _SimpleCounterState();
}

class _SimpleCounterState extends State<SimpleCounter> {

  int counter = 0;

  final counterSubject = BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart Counter'),),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('add'),
                onPressed: () {
                  setState(() {
                    counterSubject.add(++counter);
                  });
                },
              ),
              StreamBuilder<int>(
                  stream: counterSubject.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('${snapshot.data}', style: TextStyle(fontSize: 30),);
                    }
                    else
                      return Text('');
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
