import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_mind/pages/Main/Feed.dart';
import 'package:my_mind/pages/Main/Schedule.dart';
import 'package:my_mind/pages/Main/Chat.dart';

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

  final List<Widget> _children = [Schedule(), Feed(), Chat()];

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
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Mind'),
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<PageEnum>(
            captureInheritedThemes: true,
            offset: Offset(0, 60),
            tooltip: 'Configurações!',
            icon: Icon(
              Icons.more_vert,
              size: 30,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PageEnum>>[
              PopupMenuItem<PageEnum>(
                value: PageEnum.profile,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.person),
                  title: Text('Perfil!'),
                ),
              ),
              PopupMenuItem<PageEnum>(
                value: PageEnum.config,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.settings),
                  title: Text('Configurações!'),
                ),
              ),
              PopupMenuItem<PageEnum>(
                value: PageEnum.help,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.help),
                  title: Text('Ajuda!'),
                ),
              ),
              PopupMenuItem<PageEnum>(
                value: PageEnum.exit,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Sair!'),
                ),
              )
            ],
            onSelected: onSelect,
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentindex,
        items: <Widget>[
          Icon(Icons.search, size: 28),
          Icon(Icons.home, size: 28),
          Icon(Icons.chat, size: 28),
        ],
        onTap: setCurrentIndex,
      ),
      body: _children[_currentindex],
    );
  }
}
