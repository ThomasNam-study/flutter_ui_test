import 'package:flutter/material.dart';

class AniPage extends StatefulWidget {
  @override
  _AniPageState createState() => _AniPageState();
}

class _AniPageState extends State<AniPage> {
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
                AnimatedOpacity(
                  opacity: onMode ? 1 : 0.2,
                  duration: Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    //curve: Curves.slowMiddle,
                    width: onMode ? 50 : 14,
                    child: Image.asset('images/icon_spark.png'),
                  ),
                ),
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
