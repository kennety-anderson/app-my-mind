import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_mind/pages/Main/Main.dart';
import 'package:my_mind/pages/Register/SignIn.dart';
import 'package:my_mind/routes/routes.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // splashColor: Colors.transparent,
      ),
      routes: routes(context),
      home: FutureBuilder<String>(
        future: initialRoute(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Main();
          } else {
            return SignIn();
          }
        },
      ),
    );
    // home: SignIn());
  }
}
