import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'authentication/userlogin.dart';
import 'services/auth.dart';
import 'services/global.dart';


class Home extends StatefulWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(
      "Home",
    ));
  }

  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  var registeredMeet, favBooks, favMusic, favVideos;
  AuthService _auth = AuthService();

  getInfoFromBackendFn() async {
    this.registeredMeet = [
      {
        'name': 'Lets Detox',
        'place': 'AVM Hall Kochi',
        'time': '4:00 | 05/04/2020'
      },
      {
        'name': 'Open Space',
        'place': 'Community Hall Kochi',
        'time': '4:30 | 12/04/2020'
      }
    ];
    this.favBooks = [
      {'name': 'The Monk Who sold the Ferari', 'author': 'Robin Sharma'},
      {'name': 'The Alchemeist', 'author': 'Paulo Caulo'},
      {'name': 'The Monk Who sold the Ferari', 'author': 'Robin Sharma'},
      {'name': 'The Alchemeist', 'author': 'Paulo Caulo'}
    ];
    this.favMusic = [
      {'name': 'Music 1', 'artist': 'Artist 1'},
      {'name': 'Music 2', 'artist': 'Artist 2'}
    ];
    this.favVideos = [
      {'name': 'Video 1', 'type': 'comedy'},
      {'name': 'Video 2', 'type': 'Feel good'}
    ];
  }

  @override
  void initState() {
    getInfoFromBackendFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0)),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                            alignment: Alignment.bottomCenter,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  // margin: EdgeInsets.only(top:8),
                                  child: OutlineButton(
                                    highlightColor: Colors.grey[50],
                                    focusColor: Colors.black,
                                    onPressed: () async {
                                      _auth.signOut().then((_) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserLogin()));
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Text("Logout",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: pfontFamily,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.notifications_none),
                                    iconSize: 32,
                                    onPressed: () {})
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 32),
                                        child: Text("Welcome Back",
                                            style: TextStyle(
                                                fontFamily: pfontFamily,
                                                color: Colors.black,
                                                fontSize: 18)))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Text("Bob",
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                color: Colors.black,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold)))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 8),
                              child: Container(
                                height: 54,
                                width: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.settings,
                                    ),
                                    color: Colors.black,
                                    iconSize: 32,
                                    onPressed: () {}),
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 30),
                                child: Text("Meetups",
                                    style: TextStyle(
                                        fontFamily: pfontFamily,
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 4, bottom: 10, left: 30.0),
                                child: Text("You have registered",
                                    style: TextStyle(
                                        fontFamily: pfontFamily,
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)))),
                      ]),
                  Container(
                      height: 220,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 10),
                            child: RaisedButton(
                                onPressed: () {},
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(registeredMeet[index]["name"],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontFamily: sfontFamily,
                                                fontWeight: FontWeight.w600)),
                                        Text(registeredMeet[index]["place"],
                                            style: TextStyle(
                                              fontFamily: sfontFamily,
                                              fontSize: 14,
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                                registeredMeet[index]["time"],
                                                style: TextStyle(
                                                  fontFamily: sfontFamily,
                                                  fontSize: 14,
                                                )))
                                      ]),
                                ),
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5),
                          );
                        },
                        itemCount: registeredMeet.length,
                        viewportFraction: 0.7,
                        scale: 0.8,
                        containerHeight: 20,
                        containerWidth: 30,
                      )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 30, top: 24),
                                child: Text("Favourites",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: pfontFamily,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 0, bottom: 10, left: 30.0),
                                child: Text("from Library",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: pfontFamily,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal)))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 24, 8,40),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 30, left: 30, right: 30),
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(
                                    
                                    title: Text("Books",
                                        style: TextStyle(
                                            fontFamily: sfontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20)),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: favBooks.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return bookListItem(index);
                                              }),
                                        ),
                                      )
                                    ],
                                    backgroundColor: Colors.amber,
                                  ),
                                  ExpansionTile(
                                    title: Text("Music",
                                        style: TextStyle(
                                            fontFamily: sfontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20)),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: favMusic.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return musicListItem(index);
                                              }),
                                        ),
                                      )
                                    ],
                                    backgroundColor: Colors.amber,
                                  ),
                                  ExpansionTile(
                                    
                                    title: Text("Videos",
                                        style: TextStyle(
                                            fontFamily: sfontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20)),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: favVideos.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return videoListItem(index);
                                              }),
                                        ),
                                      )
                                    ],
                                    backgroundColor: Colors.amber,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                  Container(color: Colors.white, height: 60)
                ])));
  }

  bookListItem(int index) {
    return  ListTile(
       contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          onTap: () {
            print("I got pressed");
          },
          title: Text(favBooks[index]["name"],
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
          subtitle: Text(favBooks[index]["author"],
                        style: TextStyle( fontFamily: "Poppins",
                          fontSize: 12,
                        )),
          leading: Container(height:double.infinity, width:60,decoration: BoxDecoration(color: Colors.amber,
          borderRadius: BorderRadius.circular(16)
          ),
          child: Icon(Icons.book, color: Colors.black),
          ),
    );
  }

  musicListItem(int index) {
    return ListTile(
       contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          onTap: () {
            print("I got pressed");
          },
          title: Text(favMusic[index]["name"],
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
          subtitle: Text(favMusic[index]["artist"],
                        style: TextStyle( fontFamily: "Poppins",
                          fontSize: 12,
                        )),
          leading: Container(height:double.infinity, width:60,decoration: BoxDecoration(color: Colors.amber,
          borderRadius: BorderRadius.circular(16)
          ),
          child: Icon(Icons.queue_music, color: Colors.black),
          ),
    );
  }

  videoListItem(int index) {
     return ListTile(
       contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          onTap: () {
            print("I got pressed");
          },
          title: Text(favVideos[index]["name"],
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
          subtitle: Text(favVideos[index]["type"],
                        style: TextStyle( fontFamily: "Poppins",
                          fontSize: 12,
                        )),
          leading: Container(height:double.infinity, width:60,decoration: BoxDecoration(color: Colors.amber,
          borderRadius: BorderRadius.circular(16)
          ),
          child: Icon(Icons.videocam, color: Colors.black),
          ),
    );
  }
}
