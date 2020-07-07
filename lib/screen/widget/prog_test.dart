import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressTest extends StatefulWidget {
  @override
  _ProgressTestState createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest> {
  double _progress = 0.0;

  void startTimer() {
    _progress = 0.0;

    new Timer.periodic(
      Duration(milliseconds: 500),
      (Timer timer) => setState(
        () {
          if (_progress >= 1) {
            timer.cancel();
          } else {
            var test2 = _progress + 0.1;

            _progress = num.parse(test2.toStringAsFixed(1));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.cyanAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              FlatButton(
                onPressed: () {
                  startTimer();
                },
                child: Text('Click me'),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  //width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 10.0,
                  animationDuration: 300,
                  percent: _progress,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.greenAccent,
                  animateFromLastPercent: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
