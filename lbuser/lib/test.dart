import 'package:flutter/material.dart';
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
                      Expanded(
                       child:  TextFormField(
                          decoration:  InputDecoration(
                            labelText: "Search",
                            fillColor: Colors.black,
                            border:  OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(25.0),
                              borderSide:  BorderSide(
                              ),
                            ),
                            //fillColor: Colors.green
                          ),

                          keyboardType: TextInputType.text,
                          style:  TextStyle(
                            fontFamily: "Poppins",fontSize: 14.0
                          ),
                        ),
                     ),

            RaisedButton(
              elevation: 6,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
              ),
              splashColor: Colors.white,
              onPressed: () {},
              child: Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("",
                        style:
                        TextStyle(color: Colors.black, fontSize: 25))),
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 40,
                )
              ]),
              color: Colors.white,
              textColor: Colors.white,
            ),

          ],
        ),
      ),


    );
  }
}