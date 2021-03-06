import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Frenzy chat"),
      ),
      body: new ChatScreen(),
    );
  }
}
