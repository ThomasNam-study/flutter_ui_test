import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String name;
  final String text; // 출력할 메시지
  final AnimationController animationController;

  ChatMessage({this.name, this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: CircleAvatar(child: Text(name),)
            ),
            Expanded(child: Column(
                children: <Widget>[
                  Text(name, style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(text),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
