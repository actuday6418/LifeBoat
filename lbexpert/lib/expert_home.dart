import 'package:flutter/material.dart';
import 'package:lbexpert/Insights.dart';
import 'package:lbexpert/edit_profile.dart';
import 'package:lbexpert/fix_meetup.dart';
import 'package:lbexpert/notifications.dart';
import 'package:lbexpert/services/global.dart';

class ExpertHome extends StatefulWidget {
  @override
  _ExpertHomeState createState() => _ExpertHomeState();
}

class _ExpertHomeState extends State<ExpertHome> {
  var drInfoFromBackend, listInfoFromBackend;

  getInfoFromBackend() {
    drInfoFromBackend = {'name': 'Dr. Prasanth'};
    listInfoFromBackend = [
      {
        'name': 'Get Off That Booze!',
        'place': 'Best Place Around',
        'time': '4:00 | today'
      },
      {
        'name': 'Have Fun!',
        'place': 'Second Best Place Around',
        'time': '4:30 | today'
      }
    ];
  }

  @override
  void initState() {
    getInfoFromBackend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Container(
                              color: Color(0xfffff0d1),
                              child: Column(children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 16, 0, 0),
                                      child: FlatButton(
                                          shape: CircleBorder(),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.settings,
                                            size: 32,
                                            color: Colors.black,
                                          )),
                                    )),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 30, bottom: 0),
                                    child: Text("Welcome Back",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Poppins'))),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Text(drInfoFromBackend["name"],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Gilroy',
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold))),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(10)),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FixMeetup()));
                                              },
                                              color: Colors.amber,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                  height: 80,
                                                  width: 40,
                                                  child: Icon(Icons.add,
                                                      size: 40,
                                                      color: Colors.white)))),
                                      flex: 1,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, bottom: 30),
                                          child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Notifications()),
                                                );
                                              },
                                              color: Colors.amber,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                  height: 80,
                                                  width: 40,
                                                  child: Icon(
                                                      Icons.notifications,
                                                      size: 40,
                                                      color: Colors.white)))),
                                      flex: 1,
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, bottom: 30),
                                          child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfilePage()),
                                                );
                                              },
                                              color: Colors.amber,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                  height: 80,
                                                  width: 40,
                                                  child: Icon(
                                                      Icons.person,
                                                      size: 40,
                                                      color: Colors.white)))),
                                      flex: 1,
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, bottom: 30),
                                          child: FlatButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Insights()),
                                                );
                                              },
                                              color: Colors.amber,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                  height: 80,
                                                  width: 40,
                                                  child: Icon(
                                                      Icons.insert_chart,
                                                      size: 40,
                                                      color: Colors.white)))),
                                      flex: 1,
                                    ),
                                    Padding(padding: EdgeInsets.all(10))
                                  ],
                                )
                              ]))),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 25),
                        child: Text("Fixed Meetups",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontFamily: pfontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: Container(
                              height: 500,
                              child: ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: listInfoFromBackend.length,
                                      itemBuilder: (context, index) {
                                        print(listInfoFromBackend.length);
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24)),
                                                color: Colors.amber,
                                                onPressed: () {},
                                                child: Container(
                                                    height: 180,
                                                    alignment: Alignment.bottomLeft,
                                                    padding: EdgeInsets.all(8),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 0,
                                                                    left: 0.0),
                                                            child: Text(
                                                                listInfoFromBackend[
                                                                        index]
                                                                    ["name"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20, fontFamily: sfontFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 0,
                                                                    left: 0.0),
                                                            child: Text(
                                                                listInfoFromBackend[
                                                                        index]
                                                                    ["place"],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15, fontFamily: sfontFamily
                                                                ))),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 10),
                                                            child: Text(
                                                                listInfoFromBackend[
                                                                        index]
                                                                    ["time"],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 13, fontFamily: sfontFamily
                                                                )))
                                                      ],
                                                    ))));
                                      })))),
                    ]))));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
