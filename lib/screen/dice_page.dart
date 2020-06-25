import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Image _leftDice;
  Image _rightDice;

  @override
  void initState() {
    super.initState();

    _leftDice = Image.asset('images/dice1.png');
    _rightDice = Image.asset('images/dice1.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: _buildDiceButton(_leftDice),
            ),
            Expanded(
              child: _buildDiceButton(_rightDice),
            ),
          ],
        ),
      ),
    );
  }

  FlatButton _buildDiceButton(Image image) {
    return FlatButton(
      onPressed: _updateDice,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(
            turns: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: image,
      ),
    );
  }

  void _updateDice() {
    var leftDiceNumber = Random().nextInt(5) + 1;
    var rightDiceNumber = Random().nextInt(5) + 1;

    setState(() {
      _leftDice = Image.asset(
        'images/dice$leftDiceNumber.png',
        key: ValueKey(DateTime.now()),
      );

      _rightDice = Image.asset(
        'images/dice$rightDiceNumber.png',
        key: ValueKey(DateTime.now()),
      );
    });
  }
}
