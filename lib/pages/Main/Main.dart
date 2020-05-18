import 'package:flutter/material.dart';
import 'package:my_mind/customs/BoxDecoration/SimpleGradient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_mind/pages/Main/Feed.dart';
import 'package:my_mind/pages/Main/Schedule.dart';
import 'package:my_mind/pages/Main/Chat/ChatList.dart';

enum PageEnum { profile, config, help, exit }

Future logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentindex = 1;

  final List<Widget> _children = [Schedule(), Feed(), ChatList()];

  void setCurrentIndex(int index) => setState(() => _currentindex = index);

  onSelect(PageEnum value) {
    switch (value) {
      case PageEnum.exit:
        print('chamou');
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Deseja mesmo sair desta conta?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    logout();
                    Navigator.of(context).pushNamed('SignIn');
                  },
                ),
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        elevation: 10.0,
        iconSize: 30,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('buscar'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Feed'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('Conversas'),
              backgroundColor: Colors.amber),
        ],
        onTap: setCurrentIndex,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('kennty Anderson'),
              accountEmail: Text('test1@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(size: 40),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 28,
              ),
              title: Text('Sair da conta!'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Container(
          // height: 100,
          decoration: simpleBoxDecorationGradient(),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 45, bottom: 15),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.list, size: 35, color: Colors.white70),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      )
                    ],
                  )),
              Expanded(
                child: _children[_currentindex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
