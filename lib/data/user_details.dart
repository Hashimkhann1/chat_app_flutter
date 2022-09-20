

import 'dart:convert';
import 'dart:math';

class UserDetails {

  String? displayName;
  String? email;
  String? photoUrl;


  // constructor
  UserDetails({this.displayName , this.email , this.photoUrl});

  UserDetails.fromjson(Map<String , dynamic> json){
    displayName = json["displayName"];
    photoUrl = json["photoUrl"];
    email = json["email"];
  }

  Map<String , dynamic> tojson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data["displayName"] = this.displayName;
    data["email"] = this.email;
    data["photoUrl"] = this.photoUrl;

    return data;
  }

}