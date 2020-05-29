import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer _timer;

  var _time = 0;
  var _isRunning = false;

  List<String> _lapTimes = []; // 랩타임 표시

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StopWatch')),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "StopWatchBtn1",
        onPressed: () => setState(
          () {
            _clickButton();
          },
        ),
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _buildBody() {
    var sec = _time ~/ 100;
    var hundredth = '${_time % 100}'.padLeft(2, '0');

    return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '$sec',
                        style: TextStyle(fontSize: 50),
                      ),
                      Text('$hundredth')
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    child: ListView(
                      children: _lapTimes.map((time) => Text(time)).toList(),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: FloatingActionButton(
                  heroTag: "StopWatchBtn2",
                  backgroundColor: Colors.deepOrange,
                  onPressed: _reset,
                  child: Icon(Icons.rotate_left),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _recordLapTime('$sec.$hundredth');
                    });
                  },
                  child: Text('랩타임'),
                ),
              ),
            ],
          )),
    );
  }

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning)
      _start();
    else
      _pause();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _pause() {
    _timer?.cancel();
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $time');
  }
}
