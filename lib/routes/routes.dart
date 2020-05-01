import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_mind/pages/Register/SignIn.dart';
import 'package:my_mind/pages/Register/SignUp.dart';
import 'package:my_mind/pages/Main/Main.dart';
import 'package:my_mind/pages/Main/Chat.dart';

routes(BuildContext context) {
  return {
    'SignIn': (context) => SignIn(),
    'SignUp': (context) => SignUp(),
    'Main': (context) => Main(),
    'Chat': (context) => Chat(),
  };
}

Future<String> initialRoute() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String token = prefs.getString('accessToken');
  print(token);
  return token ?? null;
}
