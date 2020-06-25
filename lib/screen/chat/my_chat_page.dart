import 'package:flutter/material.dart';

class MyChatPage extends StatefulWidget {
  @override
  _MyChatPageState createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyChat'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildLeft('테스트'),
              _buildLeft('테스트 입니다'),
              _buildLeft('테스트 입니다'),
              _buildLeft('테스트 입니다'),
              _buildLeft('테스트 입니다1111입니다1111입니다1111'),
              _buildRight('테스트 입니다1111입니다1111입니다1111'),
              _buildLeft('테스트 입니다1111입니다1111입니다1111\n입니다1111입니다1111입니다1111'),
            ],
          ),
        ));
  }

  Widget _buildLeft(String msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              constraints: BoxConstraints(minWidth: 60, maxWidth: 250),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(msg, style: TextStyle(color: Colors.white,),))
        ],
      ),
    );
  }

  Widget _buildRight(String msg) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              constraints: BoxConstraints(minWidth: 60, maxWidth: 250),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(msg, style: TextStyle(color: Colors.white,),))
        ],
      ),
    );
  }
}
