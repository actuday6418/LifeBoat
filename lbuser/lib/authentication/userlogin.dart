import 'package:flutter/material.dart';
import 'package:lbuser/services/auth.dart';
import 'package:lbuser/userhome.dart';
import 'package:lbuser/authentication/usersignup.dart';

import '../basepage.dart';
import '../services/global.dart';
import 'usersignup.dart';

class UserLogin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserLogin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  bool showPassword = true;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          child: Scaffold(
          backgroundColor: Colors.white,
          body: loading
              ? loadingScreen()
              : Padding(
                  padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  child: ListView(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20)),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text('Log In',
                              style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: pfontFamily))),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            SizedBox(height: 16),
                            TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: sfontFamily),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  errorStyle: TextStyle(color: Colors.red),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontFamily: sfontFamily,
                                      color: Colors.amber),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                )),
                            Padding(padding: EdgeInsets.all(8)),
                            TextFormField(
                                obscureText: showPassword,
                                cursorColor: Colors.white,
                                validator: (val) => val.length < 6
                                    ? 'Enter Password At Least 6 characters long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "Poppins"
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    color: Colors.amberAccent,
                                    onPressed: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.amber),
                                  errorStyle: TextStyle(color: Colors.red),
                                  labelText: "Password",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                )),
                            Padding(padding: EdgeInsets.all(8)),
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                width: 200,
                                child: FlatButton(
                                    textColor: Colors.amber,
                                    color: Colors.amber,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: "Gilroy",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            loading = false;
                                            error =
                                                'There seems to be something Wrong :(';
                                          });
                                        } else {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserHome()));
                                        }
                                      }
                                    }))
                          ])),
                      SizedBox(
                        height: 64,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: FlatButton(
                            color: Colors.amber,
                            textColor: Colors.black,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
                              child: Text(
                                'Or Log In with Google',
                                
                                style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                              ),
                            ),
                            onPressed: () {
                              //signup screen
                            },
                          )),
                      Padding(padding: EdgeInsets.all(8)),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: OutlineButton(
                            textColor: Colors.black87,
                            borderSide:
                                BorderSide(color: Colors.black87, width: 3),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: Text(
                                'Register New Account',
                                style: TextStyle(fontSize: 18, fontFamily: "Gilroy", fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              //signup screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserSignup()),
                              );
                            },
                          )),
                      Padding(padding: EdgeInsets.all(4)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: FlatButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          textColor: Colors.amber,
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                    ],
                  ))),
                  onWillPop: () async{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BasePage()));
                    return false;
                  },
    );
  }

  loadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
