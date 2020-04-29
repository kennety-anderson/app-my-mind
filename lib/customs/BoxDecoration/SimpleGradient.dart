import 'package:flutter/material.dart';

BoxDecoration simpleBoxDecorationGradient() => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [const Color(0xFF003891), const Color(0xFF0063FF)],
      ),
    );
