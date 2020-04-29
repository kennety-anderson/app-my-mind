import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future teste() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var ro = await prefs.remove('accessToken');
  print(ro);
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
          },
          child: Text('Sair!'),
        ),
      ),
    );
  }
}
