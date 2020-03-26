import 'package:flutter/material.dart';
import 'package:lbuser/basepage.dart';
import 'package:lbuser/models/user.dart';
import 'package:lbuser/userhome.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return BasePage();
    } else {
      //Show the homescreen if user logged in
      return UserHome();
    }
    
  }
}