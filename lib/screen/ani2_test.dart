import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Ani2Test extends StatefulWidget {
  @override
  _Ani2TestState createState() => _Ani2TestState();
}

class _Ani2TestState extends State<Ani2Test> {
  bool onMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset('assets/loading.json', width: 300,),
                SizedBox(height: 40,),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      onMode = !onMode;
                    });
                  },
                  child: Text('Click me'),
                )
              ],
            ),
          ),
        ));
  }
}

class CodeAnimate extends StatefulWidget {
  @override
  _CodeAnimateState createState() => _CodeAnimateState();
}

class _CodeAnimateState extends State<CodeAnimate> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
