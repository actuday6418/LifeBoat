class User {

  final String uid;
  
  User({ this.uid });

}

class UserData {

  String uid;
  String name;
  String email;
  String phone;
  String status;
  int state;
  String profilePhoto;

  UserData({ this.uid, this.name, this.email, this.phone , this.status, this.state, this.profilePhoto});

  Map toMap() {
    var data = Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data["status"] = this.status;
    data["state"] = this.state;
    data["profile_photo"] = this.profilePhoto;
    return data;
  }

  // Named constructor
  UserData.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.status = mapData['status'];
    this.state = mapData['state'];
    this.profilePhoto = mapData['profile_photo'];
  }
}