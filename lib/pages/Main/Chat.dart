import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Chat page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
