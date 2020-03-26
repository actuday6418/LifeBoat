import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lbexpert/services/global.dart';

class Insights extends StatefulWidget {
  Insights({Key key}) : super(key: key);
  @override
  _InsightsState createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  var insights,rating;

  void getDataFromBackend() {
    insights = [
      {"content":"You have got a four star rating. You have got a four star rating. You have got a four star rating","stars":4},
      {"content":"You are now a famous doctor","stars":3}
    ];
    rating = "4.8";
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
          title: Text("Insights",
              style: TextStyle(
                  fontSize: 26, fontFamily: pfontFamily,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 100),
          child:  ListView.builder(
        itemBuilder: (context, index) {
    return Padding(
    padding: EdgeInsets.only(right: 20, left: 20, top: 32),
    child: ClipRRect(
    borderRadius: BorderRadius.all( Radius.circular(20)),
    child: Container(
    padding: EdgeInsets.all(20),
    color: Color(0xfffff0d1),
    child: Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
     Padding(padding: EdgeInsets.only(right: 10), child:Icon(Icons.account_circle,size: 60,color: Colors.amber,)),
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      StarDisplay(value: insights[index]["stars"]),
        Container(width: 261,
        padding: EdgeInsets.only(top:8),
            child: Text(insights[index]["content"],
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,fontFamily: sfontFamily,
            color: Colors.black))),
        ],)

    ])
    )));
    },
        itemCount: insights.length)),
            Column(
                children:<Widget>[ Center(child: Container(margin: EdgeInsets.only(top:20),
                  child: Text(rating,    style: TextStyle(
    fontSize: 50, fontFamily: pfontFamily,
    fontWeight: FontWeight.bold,
    color: Colors.black)),
                )),
    Center(child: Text("Total Rating",    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.black)))]),
],
        )
    );
  }
}


class StarDisplay extends StatelessWidget {
  final int value;  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);  @override
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