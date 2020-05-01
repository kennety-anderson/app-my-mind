import 'package:flutter/material.dart';
import 'package:my_mind/pages/Main/Feed.dart';
import 'package:my_mind/pages/Main/Schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_mind/pages/Main/Chat.dart';

Future teste() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var ro = await prefs.remove('accessToken');
  print(ro);
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentindex = 0;
  // final Int index = _currentindex;
  final List<Widget> _children = [Feed(), Schedule(), Chat()];

  void setCurrentIndex(int index) => setState(() => _currentindex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentindex,
          items: <Widget>[
            Icon(Icons.home, size: 28),
            Icon(Icons.search, size: 28),
            Icon(Icons.chat, size: 28),
          ],
          onTap: setCurrentIndex,
        ),
        body: _children[_currentindex]
        // Center(
        //   child: RaisedButton(
        //     onPressed: () async {
        //       SharedPreferences prefs = await SharedPreferences.getInstance();
        //       await prefs.clear();
        //     },
        //     child: Text('Sair!'),
        //   ),
        // ),
        );
  }
}
