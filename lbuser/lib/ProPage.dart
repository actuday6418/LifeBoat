import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProPage extends StatefulWidget {
  ProPage({Key key, this.iD}) : super(key: key);
  final iD;
  @override
  _ProPageState createState() => _ProPageState(iD);
}

class _ProPageState extends State<ProPage> {
  int iD;
  var infoFromBackend;
  var reviewsFromBackend;
  _ProPageState(this.iD);

  getDataFromBackend() {
    //Use the iD variable
    infoFromBackend = {
      "name": "Dr. Susan Matthews",
      "position": "Psychiatrist, MBA",
      "cost": "Rs.700",
      "description":
          "Feel free to chat .A friend in need ",
      "rating": 4,
      "patients": "50",
      "reviews": "32"
    };
    reviewsFromBackend = [
      {"name": "LolBoi", "content": "If you desperatly need a laugh, she's the one", "rating": 4},
      {"name": "LolGel", "content": "A friend in need indeed", "rating": 2}
    ];
  }

  @override
  void initState() {
    getDataFromBackend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        //extendBody: true,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            elevation: 0,
            backgroundColor: Colors.amber),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Text(infoFromBackend["name"],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Text(infoFromBackend["position"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400))),
                              Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(top: 8,right: 130),
                                          child: Text(infoFromBackend["cost"],
                                              style: TextStyle(
                                                fontSize: 30,
                                              ))),
                                      FlatButton(
                                          onPressed: () {},
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Padding( padding: EdgeInsets.all(8), child: Text("Register",style: TextStyle(fontSize: 25)))))
                                    ],
                                  ))
                            ],
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Text(infoFromBackend["description"],
                                style: TextStyle(fontSize: 20)))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(infoFromBackend["rating"].toString(),style: TextStyle(fontSize: 60)),
                                    StarDisplay(
                                        value: infoFromBackend["rating"])
                                  ]),
                              VerticalDivider(
                                width: 2,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      infoFromBackend["patients"] + " Patients",
                                    ),
                                    Text(
                                      infoFromBackend["reviews"] + " Reviews",
                                    )
                                  ])
                            ],
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                             child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                             Padding(
                             padding: EdgeInsets.only(right: 140),
                        child:
                        Text("Reviews",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ))),
                                  OutlineButton(
                                    borderSide: BorderSide(
                                        color: Colors.amber, width: 2),
                                    textColor: Colors.amber,
                                    color: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: Text(
                                      'More',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              )),
                              // Container(
                              //   height: 1000,
                              Container(
                                  height: 400,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                right: 20, left: 20, top: 20),
                                            child:  ClipRRect(
                                            borderRadius: BorderRadius.all( Radius.circular(20)),
                                            child: Container(
                                                padding: EdgeInsets.all(20),
                                                color: Color(0xfffff0d1),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Column(children: <Widget>[
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 10),
                                                            child: Icon(
                                                              Icons
                                                                  .account_circle,
                                                              size: 60,
                                                              color:
                                                                  Colors.amber,
                                                            )),
                                                        Text(reviewsFromBackend[
                                                            index]["name"])
                                                      ]),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          StarDisplay(
                                                              value:
                                                                  reviewsFromBackend[
                                                                          index]
                                                                      [
                                                                      "rating"]),
                                                          Container(
                                                            width: 200,
                                                              child: Text(
                                                                  reviewsFromBackend[
                                                                          index]
                                                                      [
                                                                      "content"],
                                                                      maxLines: 2,
                                                                      overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .black))),
                                                        ],
                                                      )
                                                    ]))));
                                      },
                                      itemCount: reviewsFromBackend.length))
                            ],
                          )))
                ]))));
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
