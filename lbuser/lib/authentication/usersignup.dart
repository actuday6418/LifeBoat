import 'package:flutter/material.dart';
import 'package:lbuser/authentication/userlogin.dart';
import 'package:lbuser/userhome.dart';
import 'dart:async';
import 'package:lbuser/services/auth.dart';

void main() => runApp(UserSignup());

class UserSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  double screenHeight;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';
  String phone = '';

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserLogin()));
    return false;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      child: Scaffold(
        body: loading
            ? loadingScreen()
            : SingleChildScrollView(
                child: Stack(
                children: <Widget>[
                  lowerHalf(context),
                  upperHalf(context),
                  loginCard(context),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 36, 0, 0),
                      child: FlatButton(
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin())),
                          child: Row(children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.arrow_back),
                                iconSize: 32,
                                color: Colors.black,
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserLogin()))),
                            Text("Back to Log In",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Gilroy",fontWeight: FontWeight.bold))
                          ])))
                ],
              )),
      ),
      onWillPop: _willPopCallback,
    );
  }

  loadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      color: Colors.amber,
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Colors.amber,
      ),
    );
  }

  Widget loginCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gilroy",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: "Poppins"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle, size: 30),
                          labelText: "Name",
                          hasFloatingPlaceholder: true),
                      keyboardType: TextInputType.text,
                      validator: (val) =>
                          val.isEmpty ? 'This field is mandatory' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: "Poppins"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: "Email",
                          hasFloatingPlaceholder: true),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          val.isEmpty ? 'This field is mandatory' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: "Poppins"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: "Phone number",
                          hasFloatingPlaceholder: true),
                      keyboardType: TextInputType.phone,
                      validator: (val) =>
                          val.isEmpty ? 'This field is mandatory' : null,
                      onChanged: (val) {
                        setState(() => phone = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: "Poppins"),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hasFloatingPlaceholder: true),
                      keyboardType: TextInputType.text,
                      validator: (val) =>
                          val.isEmpty ? 'This field is mandatory' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                            child: Text("Sign In", style: TextStyle(fontFamily: "Gilroy", fontSize: 20,fontWeight: FontWeight.bold,),),
                            color: Colors.amber,
                            textColor: Colors.white,
                            padding: EdgeInsets.only(
                                left: 38, right: 38, top: 15, bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password, phone, name);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'Could not sign in with those credentials';
                                  });
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserHome()));
                                }
                              }
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Poppins", fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
