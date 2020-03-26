import 'package:flutter/material.dart';

import 'chat_list_screen.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.white,
          ),
        ),
        body: Container(
          child: ChatListScreen(),
        ));
  }
}
