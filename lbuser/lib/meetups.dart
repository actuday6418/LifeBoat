import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'services/global.dart';


class MeetUps extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(
      "Meetups",
      style: TextStyle(fontFamily: 'Gilroy'),
    ));
  }

  _MeetUpsState createState() => new _MeetUpsState();
}

class _MeetUpsState extends State<MeetUps> {
  var aroundMeet, whatYouLikeMeet;

  getInfoFromBackendFn() async {
    this.aroundMeet = [
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
    this.whatYouLikeMeet = [
      {
        'name': 'Don\'t Get Off That Booze!',
        'place': 'Worst Place Around',
        'time': '4:00 | today'
      },
      {
        'name': 'Get A Life!',
        'place': 'New Best Place Around',
        'time': '7:00 | today'
      }
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
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            preferredSize: Size.fromHeight(0)),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //BEGIN OF SEARCH
                  Padding(
                    padding: const EdgeInsets.only(left: 60, top: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(),
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                                hintText: "Search",
                                border:
                                    InputBorder.none //fillColor: Colors.green
                                ),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                height: 1,
                                fontFamily: "Poppins",
                                fontSize: 20.0),
                          ),
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                          ),
                          iconSize: 32,
                        )
                      ],
                    ),
                  ),
                  // END OF SEARCH
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 33, top: 32),
                                child: Text("Take Part in",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: pfontFamily)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text("Meetups",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 36,
                                        fontFamily: pfontFamily,
                                        fontWeight: FontWeight.bold)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 40, bottom: 20, left: 30.0),
                                child: Text("Around you",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: pfontFamily,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold)))),
                      ]),
                  Container(
                      height: 200,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: RaisedButton(
                                  onPressed: () {},
                                  child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 2, left: 0.0),
                                                child: Text(
                                                    aroundMeet[index]["name"],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: sfontFamily,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 0, left: 0.0),
                                                child: Text(
                                                    aroundMeet[index]["place"],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sfontFamily))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                    aroundMeet[index]["time"],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sfontFamily)))
                                          ])),
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  elevation: 5));
                        },
                        itemCount: aroundMeet.length,
                        viewportFraction: 0.7,
                        scale: 0.8,
                        containerHeight: 20,
                        containerWidth: 30,
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.only(bottom: 20, top: 36, left: 30.0),
                          child: Text("You Might Like",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: pfontFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)))),
                  Container(
                      height: 200,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: RaisedButton(
                                  onPressed: () {},
                                  child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 2, left: 0.0),
                                                child: Text(
                                                    whatYouLikeMeet[index]
                                                        ["name"],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        height: 1.2,
                                                        fontFamily: sfontFamily,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 0, left: 0.0),
                                                child: Text(
                                                    whatYouLikeMeet[index]
                                                        ["place"],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sfontFamily))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                    whatYouLikeMeet[index]
                                                        ["time"],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            sfontFamily)))
                                          ])),
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  elevation: 5));
                        },
                        itemCount: whatYouLikeMeet.length,
                        viewportFraction: 0.7,
                        scale: 0.8,
                        containerHeight: 20,
                        containerWidth: 30,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              color: Color(0xfffff0d1),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 60,
                                                bottom: 2,
                                                left: 30.0),
                                            child: Text("Categories",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: pfontFamily,
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.bold)))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 0, bottom: 40, left: 30.0),
                                            child: Text("To choose from",
                                                style: TextStyle(
                                                  fontFamily: pfontFamily,
                                                  color: Colors.black,
                                                  fontSize: 16,
//                                                    fontFamily: "Gilroy"
                                                )))),
                                    Row(children: <Widget>[
                                      categoryTile("Health & Wellness"),
                                      Padding(padding: EdgeInsets.all(8)),
                                      categoryTile("Health & Wellness"),
                                    ]),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 40)),
                                    Row(children: <Widget>[
                                      categoryTile("Health & Wellness"),
                                      Padding(padding: EdgeInsets.all(8)),
                                      categoryTile("Health & Wellness"),
                                    ]),
                                    Padding(padding: EdgeInsets.all(60))
                                  ])))),
                ])));
  }
}

categoryTile(String category) {
  return Expanded(
      child: RaisedButton(
          onPressed: () {},
          child: Container(
              height: 140,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text("$category",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: sfontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))),
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 5));
}
