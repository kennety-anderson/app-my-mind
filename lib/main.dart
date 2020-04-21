import 'package:flutter/material.dart';
import 'package:my_mind/pages/Register/SignIn.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Mind Health',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'SignIn',
        routes: {'SignIn': (context) => SignIn()});
    // home: SignIn());
  }
}
