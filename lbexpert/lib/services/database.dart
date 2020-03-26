import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lbexpert/models/user.dart';
import 'package:lbexpert/services/strings.dart';

class DatabaseService {
  final String uid;
  StorageReference _storageReference;
  DatabaseService({this.uid});
  static final Firestore firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  // collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('userDatas');

  Future<void> updateUserData(String name, String email, String phone,
      [String picture]) async {
    UserData _user = UserData(
        uid: uid,
        name: name,
        email: email,
        phone: phone,
        profilePhoto: picture);

    return await userDataCollection.document(uid).setData(_user.toMap());
  }

  // UserData list from snapshot
  List<UserData> _userDataListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return UserData(
          uid: uid,
          name: doc.data['name'],
          email: doc.data['email'],
          phone: doc.data['phone']);
    }).toList();
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        email: snapshot.data['email'],
        phone: snapshot.data['phone']);
  }

  // get UserDatas stream
  Stream<List<UserData>> get userDatas {
    return userDataCollection.snapshots().map(_userDataListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userDataCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Future<List<UserData>> fetchAllUsers(FirebaseUser currentUser) async {
    List<UserData> userList = List<UserData>();

    QuerySnapshot querySnapshot =
        await firestore.collection(USERS_COLLECTION).getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      if (querySnapshot.documents[i].documentID != currentUser.uid) {
        userList.add(UserData.fromMap(querySnapshot.documents[i].data));
      }
    }
    return userList;
  }

  
    Future<String> uploadImageToStorage(File imageFile) async {
    // mention try catch later on

    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().millisecondsSinceEpoch}');
      StorageUploadTask storageUploadTask =
          _storageReference.putFile(imageFile);
      var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
      // print(url);
      return url;
    } catch (e) {
      return null;
    }
  }

  
}
