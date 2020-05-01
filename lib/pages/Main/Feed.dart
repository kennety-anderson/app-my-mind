import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Feed page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
