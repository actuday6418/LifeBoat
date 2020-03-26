import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lbexpert/services/global.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var notifications;

  void getDataFromBackend() {
    notifications = [
      "You have got a five star rating from your patient Surendar Singh",
      "You are now a famous doctor"
    ];

  }

  @override
  void initState() {
    getDataFromBackend();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          title: Text("Notifications",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: pfontFamily,
                  color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xfffff0d1),
                            ),
                              padding: EdgeInsets.all(20),
                              
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                Container(width: 2, height: 24, color: Colors.black, margin: EdgeInsets.only(right:20, left: 10),),//DOES NOT WORK. WHY??!?
                                Expanded(
                                                                child: Container(
                                    child: Text(notifications[index],maxLines: 2, overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: sfontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ),
                                )
                              ])),
                      );
              },
              itemCount: notifications.length),
        ));
  }
}
