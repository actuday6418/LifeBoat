import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authentication/userlogin.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => new _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final pageData = [
    {
      "name": "Meet New Communities",
      "description":
          "Explore Meet Ups around you to take part in, and find someone who can inspire you to become better self"
    },
    {
      "name": "Discover our Vast Library",
      "description":
          "Get inspired by reading books, or by listening to soothing music, or why not some inspired videos"
    },
    {
      "name": "Chat with the experts",
      "description":
          "Explore and talk to our experts, who will help you solve all your problems, and make you feel better"
    }
  ];
  final images = [Image(image: AssetImage('assets/images/Meetups.jpeg')),Image(image: AssetImage('assets/images/Library.jpeg')),Image(image: AssetImage('assets/images/Chats.jpeg'))];
  SwiperController _controller = SwiperController();
  var textHeading = "Meet New Communities";
var textDescr =  "Explore Meet Ups around you to take part in, and find someone who can inspire you to become better self";
var showNext = true;
  @override
  void initState()
  {
    super.initState();
  }
  changText(index) {

    setState(() {
      textHeading = pageData[index]["name"];
      textDescr = pageData[index]["description"];
      if(index == pageData.length-1)
      showNext = false;
      else
        showNext = true;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height/2,
                      child: Swiper(
                        onIndexChanged: (int index) => changText(index),
                        itemBuilder: (BuildContext context, int index) {
                        /*  return Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Container(
                                width: 900,
                                child: Center(child: Text(pageData[index]["name"])),
//                                child: Center(child: Image.asset('assets/images/lake.jpg'),),

                                color: Colors.amber,
                              ));*/
                        return images[index];
                        },
                        itemCount: pageData.length,
                        viewportFraction: 1.0,
                        scale: 0.7,loop: false,
                        controller: _controller,
                        pagination: SwiperPagination(),
                      )),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('$textHeading',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gilroy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
                  Padding(
                      padding: EdgeInsets.only(left: 45, right: 45, top: 10),
                      child: Text('$textDescr',textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",))),
                  if (showNext) Padding(padding: EdgeInsets.only(top: 30),
                   child: RaisedButton(
                    textColor: Colors.amber,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 57, vertical: 10),child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                    onPressed: () {
                        _controller.next();
                    },
                  )),
                  Padding(padding: EdgeInsets.all(4),),
                  if (showNext) Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: OutlineButton(
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                    textColor: Colors.amber,
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"
                      ),
                    )),
                    onPressed: () {
                      Navigator.pushReplacement(

                              context,
                              MaterialPageRoute(builder: (context) => UserLogin())
                      );
                    },
                  )),
                  if (!showNext) Padding(padding: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        textColor: Colors.amber,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"
                          ),
                        )),
                        onPressed: () {
                          Navigator.pushReplacement(

                              context,
                              MaterialPageRoute(builder: (context) => UserLogin())
                          );
                        },
                      ))
            ])));
  }
}
