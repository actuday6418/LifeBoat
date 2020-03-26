import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'services/global.dart';


class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController _tabController;
  var mightLikeBooks, mightLikeMusic, mightLikeVideos;

  final List<Tab> myTabs = <Tab>[
    Tab(text: "Books"),
    Tab(text: "Music"),
    Tab(text: "Videos"),
  ];

  getInfoFromBackendFn() async {
    this.mightLikeBooks = [
      {"name": "The Sam Club", "author": "Robin Sharma"},
      {"name": "Fault in our stars", "author": "Denin Paul"},
    ];
    this.mightLikeMusic = [
      {"name": "Another day", "artist": "Robert Djangloro"},
      {"name": "East to West", "artist": "Casting Crowns"}
    ];
    this.mightLikeVideos = [
      {"name": "I was only 12 ", "author": "Dom Dipeiro"},
      {"name": "Lets laugh", "author": "Jagath Jijo"}
    ];
  }

  @override
  void initState() {
    getInfoFromBackendFn();
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 220,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                                cursorColor: Colors.amber,
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    border: InputBorder
                                        .none //fillColor: Colors.green
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 33, top: 30),
                              child: Text("Browse through ",
                                  style: TextStyle(
                                      fontFamily: pfontFamily,
                                      color: Colors.black,
                                      fontSize: 16)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text("Our Library",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)))),
                    ],
                  )),
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(55),
                      child: Container(
                          color: Colors.white,
                          child: TabBar(
                              labelColor: Colors.black,
                              tabs: myTabs,
                              controller: _tabController,
                              indicatorColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab))),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                String label;
                setState(() {
                  label = tab.text;
                });

                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //THE FOLLOWING THREE IF STATEMENT'S BODIES HAVE SIMILAR CODE. WE MUST IMPROVE PERFORMANCE LATER ON BY
                          //USING CONDITIONALS WHEREVER REQUIRED WITHIN THEIR BODIES (215 LINES EACH)
                          if (label == "Books")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 2, top: 36, left: 30.0),
                                        child: Text("You Might Like",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: pfontFamily,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold)))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20, top: 0, left: 30.0),
                                        child: Text("Books handpicked for you",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: pfontFamily,
                                              fontSize: 16,
                                            )))),
                                Container(
                                    height: 220,
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 5, top: 5),
                                            child: RaisedButton(
                                                onPressed: () {},
                                                child: Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 2,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeBooks[
                                                                          index][
                                                                      "name"],
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      height:
                                                                          1.2,
                                                                      fontFamily:
                                                                          sfontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 0,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeBooks[
                                                                          index]
                                                                      [
                                                                      "author"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          sfontFamily))),
                                                        ])),
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                elevation: 5));
                                      },
                                      itemCount: mightLikeBooks.length,
                                      viewportFraction: 0.4,
                                      scale: 0.6,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 60),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            color: Color(0xfffff0d1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 60,
                                                                  bottom: 2,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "Categories",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      pfontFamily,
                                                                  fontSize: 26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0,
                                                                  bottom: 40,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "To choose from",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    pfontFamily,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
//                                                    fontFamily: "Gilroy"
                                                              )))),
                                                  Row(children: <Widget>[
                                                    categoryTile("Motivation"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile("Comedy"),
                                                  ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 40)),
                                                  Row(children: <Widget>[
                                                    categoryTile("Thriller"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile("RealLife"),
                                                  ]),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(60))
                                                ])))),
                              ],
                            ),
//-----------------------------------------------------------------------------------------------

                          if (label == "Music")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 2, top: 36, left: 30.0),
                                        child: Text("You Might Like",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: pfontFamily,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold)))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20, top: 0, left: 30.0),
                                        child: Text("Music handpicked for you",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: pfontFamily,
                                              fontSize: 16,
                                            )))),
                                Container(
                                    height: 220,
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 5, top: 5),
                                            child: RaisedButton(
                                                onPressed: () {},
                                                child: Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 2,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeMusic[
                                                                          index][
                                                                      "name"],
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      height:
                                                                          1.2,
                                                                      fontFamily:
                                                                          sfontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 0,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeMusic[
                                                                          index]
                                                                      [
                                                                      "artist"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          sfontFamily))),
                                                        ])),
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                elevation: 5));
                                      },
                                      itemCount: mightLikeMusic.length,
                                      viewportFraction: 0.4,
                                      scale: 0.6,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 60),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            color: Color(0xfffff0d1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 60,
                                                                  bottom: 2,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "Categories",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      pfontFamily,
                                                                  fontSize: 26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0,
                                                                  bottom: 40,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "To choose from",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    pfontFamily,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
//                                                    fontFamily: "Gilroy"
                                                              )))),
                                                  Row(children: <Widget>[
                                                    categoryTile(
                                                        "Upbeat Music"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile(
                                                        "Country Music"),
                                                  ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 40)),
                                                  Row(children: <Widget>[
                                                    categoryTile("Pop Music"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile("Others"),
                                                  ]),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(60))
                                                ])))),
                              ],
                            ),
//-------------------------------------------------------------------------------------------

                          if (label == "Videos")
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 2, top: 36, left: 30.0),
                                        child: Text("You Might Like",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: pfontFamily,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold)))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20, top: 0, left: 30.0),
                                        child: Text("Videos handpicked for you",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: pfontFamily,
                                              fontSize: 16,
                                            )))),
                                Container(
                                    height: 220,
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 5, top: 5),
                                            child: RaisedButton(
                                                onPressed: () {},
                                                child: Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 2,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeVideos[
                                                                          index][
                                                                      "name"],
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      height:
                                                                          1.2,
                                                                      fontFamily:
                                                                          sfontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 0,
                                                                      left:
                                                                          0.0),
                                                              child: Text(
                                                                  mightLikeVideos[
                                                                          index]
                                                                      [
                                                                      "author"],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          sfontFamily))),
                                                        ])),
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                elevation: 5));
                                      },
                                      itemCount: mightLikeVideos.length,
                                      viewportFraction: 0.4,
                                      scale: 0.6,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 60),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30)),
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            color: Color(0xfffff0d1),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 60,
                                                                  bottom: 2,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "Categories",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      pfontFamily,
                                                                  fontSize: 26,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0,
                                                                  bottom: 40,
                                                                  left: 30.0),
                                                          child: Text(
                                                              "To choose from",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    pfontFamily,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
//                                                    fontFamily: "Gilroy"
                                                              )))),
                                                  Row(children: <Widget>[
                                                    categoryTile("Motivation"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile("Comedy"),
                                                  ]),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 40)),
                                                  Row(children: <Widget>[
                                                    categoryTile("Feel Good"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(8)),
                                                    categoryTile("Ted Talks"),
                                                  ]),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(60))
                                                ])))),
                              ],
                            ),
                        ]));
              }).toList(),
            )));
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
}
