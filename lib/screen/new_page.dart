import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

  Color nowColor = Colors.red;

  double width = 100;

  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새로운 페이지'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        'F',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.slowMiddle,
                      color: nowColor,
                      width: width,
                      height: height,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              setState(() {
                if (nowColor.value == Colors.blueAccent.value) {
                  nowColor = Colors.red;
                  width = 100;
                  height = 100;
                }

                else {
                  nowColor = Colors.blueAccent;
                  width = 200;
                  height = 200;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
