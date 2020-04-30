import 'package:flutter/material.dart';

InputDecoration inputOutlineIcon(String hintText, Widget icon) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 5),
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey),
    // prefixIcon: icon,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white60),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white60),
    ),
  );
}
