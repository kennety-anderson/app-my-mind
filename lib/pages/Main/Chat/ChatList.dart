import 'package:flutter/material.dart';
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70),
          ),
        ),
      ),
    );
  }
}
