import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutteruitest/screen/chat/chat_message.dart';

const String _name = "HERE4YOU";

// https://here4you.tistory.com/147

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];

  final TextEditingController _textController = TextEditingController();

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 6,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                reverse: true,
                itemCount: _messages.length,
                  itemBuilder: (_, index) {
                return _messages[index];
              }),
            ),
            Divider(height: 1,),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextComposer() {}
}
