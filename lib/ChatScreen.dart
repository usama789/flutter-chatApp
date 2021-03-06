import 'package:chatApp/chatMessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<chatMessage> _messages = <chatMessage>[];
  void _handleSubmitted(String text) {
    _textController.clear();
    chatMessage message = new chatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: [
              new Flexible(
                child: new TextField(
                  decoration:
                      new InputDecoration.collapsed(hintText: "send a message"),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
        )),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
