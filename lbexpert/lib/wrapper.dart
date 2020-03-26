import 'package:flutter/material.dart';
import 'package:lbexpert/models/user.dart';
import 'package:provider/provider.dart';

import 'expert_login.dart';
import 'expert_main.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return ExpertLogin();
    } else {
      //Show the homescreen if user logged in
      return ExpertMain();
    }
    
  }
}