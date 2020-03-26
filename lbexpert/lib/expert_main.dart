import 'package:flutter/material.dart';
import 'package:lbexpert/chats/chat_list_screen.dart';
import 'package:lbexpert/expert_home.dart';

class ExpertMain extends StatefulWidget {
  ExpertMain({Key key}) : super(key: key);
  @override
  _ExpertMainState createState() => _ExpertMainState();
}

class _ExpertMainState extends State<ExpertMain> {
  var style = TextStyle(fontFamily: "Poppins");

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = ExpertHome();
        break;
      case 1:
        child = ChatListScreen();
        break;
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SizedBox.expand(child: child),
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home', style: style),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble),
                    title: Text(
                      'Chats',
                      style: style,
                    ),
                  ),
                ],
                selectedItemColor: Colors.amber[600],
                unselectedItemColor: Colors.grey,
                unselectedIconTheme: IconThemeData(size: 28),
                onTap: (newIndex) => setState(() => _index = newIndex),
                currentIndex: _index,
                showUnselectedLabels: false,
                iconSize: 30,
                type: BottomNavigationBarType.fixed,
              ),
            )));
  }
}
