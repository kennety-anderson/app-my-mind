import 'package:flutter/material.dart';
import 'package:my_mind/routes/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Mind Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // splashColor: Colors.transparent,
      ),
      initialRoute: 'SignIn',
      routes: routes(context),
    );
    // home: SignIn());
  }
}
