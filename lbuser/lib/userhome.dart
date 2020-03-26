import 'package:flutter/material.dart';
import 'chats/chats.dart';
import 'package:lbuser/experts.dart';
import 'package:lbuser/home.dart';
import 'package:lbuser/library.dart';
import 'package:lbuser/meetups.dart';

class UserHome extends StatefulWidget {
  UserHome({Key key}) : super(key: key);
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;
  var style = TextStyle(fontFamily:"Poppins");
//  static const TextStyle optionStyle =
//  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static const List<Widget> _widgetOptions = <Widget>[
////    UserLogin(),
//    Text(
//      'Index 1: Business',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 2: School',
//      style: optionStyle,
//    ),
//  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = Home();
        break;
      case 1:
        child = MeetUps();
        break;
      case 2:
        child = Library();
        break;
      case 3:
        child = Experts();
        break;
      case 4:
        child = Chats();
        break;
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,

        body:
        SizedBox.expand(child: child),


        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal:8, vertical:2),
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
                    icon: Icon(Icons.people),
                    title: Text('Meetups', style: style,),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_library),
                    title: Text('Library', style: style),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contacts),
                    title: Text('Experts', style: style),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble),
                    title: Text('Chats', style: style),
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
            )


        ));
  }
}
