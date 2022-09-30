import 'package:flutter/material.dart';

class User {
  var username, password, email, intrestId, id, imageAsBase64;

  User(
      {this.id,
      this.email,
      this.imageAsBase64,
      this.intrestId,
      this.password,
      this.username});
  User.empty() {}

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) {
      data['id'] = id;
    }
    data['email'] = email;
    data['imageAsBase64'] = imageAsBase64;
    data['intrestId'] = intrestId;
    data['password'] = password;
    data['username'] = username;
    return data;
  }

  @override
  toString() {
    return {
      'id': id,
      'email': email,
      'imageAsBase64': imageAsBase64,
      'intrestId': intrestId,
      'password': password,
      'username': username,
    }.toString();
  }
}
