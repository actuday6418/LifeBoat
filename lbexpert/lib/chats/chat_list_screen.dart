import 'package:flutter/material.dart';
import 'package:lbexpert/services/auth.dart';
import 'package:lbexpert/services/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lbexpert/expert_login.dart';

import '../services/global.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

//global
final DatabaseService _repository = DatabaseService();

class _ChatListScreenState extends State<ChatListScreen> {
  String currentUserId;
  String initials = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository.getCurrentUser().then((user) {
      setState(() {
        currentUserId = user.uid;
        print("id: $currentUserId");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChatListContainer(),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  String currentUserId;
  final AuthService _auth = AuthService();
  ScrollController _controller = ScrollController();
  String userIconImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS5JVBgX8I4xVEghMJaaNnnTmj8TI8iNogc6SZkDxu0lBSmTVgf";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository.getCurrentUser().then((user) {
      setState(() {
        currentUserId = user.uid;
        print("id: $currentUserId");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[50],
        child: StreamBuilder(
            stream: Firestore.instance.collection('userDatas').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber)),
                );
              } else {
                var roundness = Radius.circular(32);
                return ListView(
                  controller: _controller,
                  children: <Widget>[
                    Container(
                      height: 220,
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(28, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(" Step up with our",
                                        style:
                                            TextStyle(fontFamily: pfontFamily)),
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text(
                                      "Chats",
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontFamily: pfontFamily,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  borderRadius: BorderRadius.only(
                                      topLeft: roundness, topRight: roundness)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.all(24),
                              child: OutlineButton(
                                onPressed: () async {
                                  _auth.signOut().then((_) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ExpertLogin()));
                                  });
                                },
                                child: Text("Logout",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontFamily: pfontFamily,
                                        fontWeight: FontWeight.bold)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.amber, width: 2),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: snapshot.data.documents.length * 100.0,
                        child: (!snapshot.hasData)
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.amber))
                            : ListView.builder(
                                controller: _controller,
                                padding: EdgeInsets.all(10.0),
                                itemBuilder: (context, index) => buildItem(
                                    context, snapshot.data.documents[index]),
                                itemCount: snapshot.data.documents.length,
                              )),
                  ],
                );
              }
            }));
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    print("id: $currentUserId");
    if (document['uid'] == currentUserId) {
      return Container();
    } else {
      return Container(
        child: Center(
          child: RaisedButton(
            elevation: 1,
            child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Container(
                  child: Material(
                    color: Colors.amber,
                    child: document['profile_photo'] != null
                        ? CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.amber),
                              ),
                              width: 50.0,
                              height: 50.0,
                              padding: EdgeInsets.all(15.0),
                            ),
                            imageUrl: document['profile_photo'],
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.person_outline,
                              size: 36.0,
                              color: Colors.black,
                            ),
                          ),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
                title: Text(
                  '${document['name']}',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: sfontFamily),
                ),
                subtitle: Text(
                  'About: ${document['status'] ?? 'Hey, you are using LifeBoat'}',
                  style: TextStyle(color: Colors.amber, fontSize: 12, fontFamily: sfontFamily),
                )),
            onPressed: () {
              print(currentUserId);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chat(
                            peername: document['name'],
                            id: currentUserId,
                            peerId: document.documentID,
                            peerAvatar: document['profile_photo'] != null
                                ? document['profile_photo']
                                : userIconImage,
                          )));
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
        margin: EdgeInsets.only(bottom: 8.0, left: 5.0, right: 5.0),
        height: 100,
      );
    }
  }
}
