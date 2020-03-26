import 'package:flutter/material.dart';
import 'package:lbexpert/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'wrapper.dart';

void main() async {
  Future.delayed(Duration(seconds: 3)).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        home: Wrapper(),
      ),
    );
  }
}
