import 'package:flutter/material.dart';

BoxDecoration simpleBoxDecorationGradient() => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        colors: [
          Colors.lightBlue[800],
          Colors.lightBlue[600],
          Colors.lightBlue[400]
        ],
      ),
    );
